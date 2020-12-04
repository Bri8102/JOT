class TasksController < ApplicationController
    before_action :set_list
    # before_action :set_task

    # def index
    #     @task = Task.all
    # end

    def new
      if params[:list_id]
        @list = List.find_by_id(params[:list_id])
        @task = @list.tasks.build
      binding.pry
      else
        @task = Task.new
        binding.pry
      end
  end

    def complete
      @task.update_attribute(:completed_at, Time.now)
      redirect_to @list, notice: "Todo item completed"
    end
    
    def create
      @task = @list.tasks.build(task_params)
      @task.save
      binding.pry
      redirect_to @list
    end
    
    # def edit
    #   @task = Task.find(params[:id])
    #   @task.update(task_params)

    #   redirect_to list_path(@task.list)
    # end

    def destroy
      @task = @list.tasks.find(params[:id])
      @task.destroy
      redirect_to @list
    end

    private

    def set_list
      @list = List.find(params[:list_id])
    end


    # def set_task
    #   @task = @list.tasks.find(params[:id])
    # end
    
    def task_params
      params.require(:task).permit(:name)
    end
end
