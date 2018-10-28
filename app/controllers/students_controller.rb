class StudentsController < ApplicationController
    def index
        @students=Student.all.order('created_at ASC')
        @cohorts=Cohort.all.map{|c| [c.name, c.id]}
    end

    def new
        @student=Student.new
    end

    def create
        @student=Student.create(first_name: params[:student][:first_name],
        last_name: params[:student][:last_name], 
        age: params[:student][:age] ,
        education: params[:student][:education]
        )

        redirect_to '/students'
    end

    def show
        @student=Student.find(params[:id])
    end

    def edit
        @student=Student.find(params[:id])
    end

    def update
        @student=Student.find(params[:id])
        @student.update(first_name: params[:student][:first_name],
        last_name: params[:student][:last_name], 
        age: params[:student][:age] ,
        education: params[:student][:education],
        cohort_id: params[:student][:cohort_id]
        )
        # redirect_to student_path(@student.id)
    end

    def remove
        to_remove=StudentsCohort.find_by(student_id: params[:student_id], cohort_id: params[:cohort_id])
        to_remove.destroy
        respond_to do |format|
            format.html {redirect_to students_path}
            format.js 
        end
        redirect_to students_path
    end

    def destroy
        @student=Student.find(params[:id])
        @student.destroy
        respond_to do |format|
            format.html {redirect_to students_path}
            format.js 
        end
end
end
