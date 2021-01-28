class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]


    def index
      @lists = List.all
      # @list.user_id = current_user.id
    end
    
    def show
    
      @list.user_id = current_user.id
      @task = Task.find_by_id(params[:id])
      @user = User.find_by_id(params[:id])

      # @task = Task.new
      # binding.pry
    end
  
    def new 
      @list = List.new
      # @list.tasks.build
    end
    
    def create
      @list = List.new(list_params)
      @list.user_id = current_user.id
      if @list.save
        redirect_to @list
        flash[:notice] = "Your list was created"
      else
        render :new
      end
    end

    # def assign_task
    #   @user = User.new
    #   @select_user = User.find_by_name(params[:email])
    #   @user.user_id = @select_user[:id]
    #   @user.email = params[:email]
    #   @user.save
    #   render :action => "successfully assigned task"
    # end

    def edit
      # @list = List.find(params[:id])
    end

    def update
      # @list = List.find(params[:id])
      @list.update(list_params)
      redirect_to @list, notice: "List was successfully updated."
    end
  
    def destroy
      # @list = List.find(params[:id])
      @list.destroy
      # @task = Task.find_by(params[:id])
      # @task.destroy
      redirect_to @list
    end
    
    private

    def set_list
      @list = List.find(params[:id])
    end
  
    def list_params
      params.require(:list).permit(:title, :description, :user_id)
    end
    
    #   def require_login
    #     return head(:forbidden) unless session.include? :user_id    
    #   end
end
