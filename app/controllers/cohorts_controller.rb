class CohortsController < ApplicationController
    def index
        @cohorts=Cohort.all.order('created_at ASC')
        @cohort=Cohort.new
        @courses=Course.all.map{ |c| [c.name, c.id]}
        @students=Student.all.map{|student| [student.first_name, student.id]}
    end

    def new
        @cohort=Cohort.new
        @courses=Course.all.map{ |c| [c.name, c.id]}
    end

    def create
        @cohort=Cohort.create(name: params[:cohort][:name],
        start_date: params[:cohort][:start_date],
        end_date: params[:cohort][:end_date],
        course_id: params[:cohort][:course_id])
        redirect_to '/cohorts'
    end

    def edit
            @instructors=Instructor.all
            @cohort=Cohort.find(params[:id])
            @courses=Course.all
            @students_cohorts=Student.all.map{|s| [s.first_name, s.id] }
    end

    def show
        @cohort=Cohort.find(params[:id])
    end

    def update
        @cohort=Cohort.find(params[:id])
        @cohort.update(name: params[:cohort][:name],
        start_date: params[:cohort][:start_date],
        end_date: params[:cohort][:end_date],
        course_id: params[:cohort][:course_id])
        redirect_to '/cohorts'
    end

    def destroy
        @cohort=Cohort.find(params[:id])
        @cohort.destroy
        respond_to do |format|
            format.html {redirect_to cohorts_path}
            format.js 
        end
    end

    def create_students_cohort
        array=params[:students_ids]
        array.map!(&:to_i)
        array=array[1..-1]
        array.each do |student_id|
            puts student_id
        StudentsCohort.create(
            student_id: student_id,
            cohort_id: params[:cohort_id]
        )
        end
        redirect_to '/cohorts'
    end
end
