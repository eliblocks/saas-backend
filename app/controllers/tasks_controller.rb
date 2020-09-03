class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]

  def index
    @tasks = current_user.account.tasks.includes(:creator, :completor).order(:created_at).map do |task|
      {
        id: task.id,
        content: task.content,
        creator: task.creator&.full_name,
        completor: task.completor&.full_name
      }
    end

    render json: { tasks: @tasks, is_limited: current_account.is_limited }
  end

  def create
    if current_account.is_limited
      render json: { error: 'Task limit reached' }, status: :unprocessable_entity
      return
    end

    @task = Task.new(content: params[:task][:content], account: current_user.account, creator_id: current_user.id)

    if @task.save
      render json: { task: @task }
    else
      render json: { errors: @task.errors.full_messages }
    end
  end

  def update
    if @task.completor_id
      @task.completor_id = nil
    else
      @task.completor_id = current_user.id
    end

    if @task.save
      render json: { task: @task }
    else
      render json: { errors: @task.errors.full_messages }
    end
  end

  def destroy
    @task.destroy!

    head :ok
  end

  private

  def set_task
    @task = current_user.account.tasks.find(params[:id])
  end
end
