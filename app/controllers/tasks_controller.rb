class TasksController < ApplicationController
    before_action :find_user, only: [:index, :new, :create, :find_task]
    before_action :find_task, only: [:edit, :update, :show,:destroy]
    
    def index
        @tasks = @user.tasks.all
    end

    def show
    end

    def new
        @task = @user.tasks.new()
    end

    def create
        @task = @user.tasks.new(task_params)
        if @task.save
          flash[:success] = "Task successfully created"
          redirect_to user_tasks_path(@user)
            else
          flash[:error] = "Something went wrong"
          render :new
        end
    end

    def edit
    end
    
    def update          
        if @task.update(task_params)
          flash[:success] = "Task was successfully updated"
          redirect_to root_path
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
        
        if @task.destroy
            flash[:success] = 'Task was successfully deleted.'
            redirect_to user_tasks_path(@user)
        else
            flash[:error] = 'Something went wrong'
            redirect_to user_tasks_path(@user)
        end
    end

    def find_user
        @user = current_user 
        puts @user      
    end
    
    def find_task
        @user = current_user        
        @task = @user.tasks.find(params[:id]) 
    end
    

    private

    def task_params
        params.require(:task).permit(:description,:completed)
    end
    
end
