class InstructorsController < ApplicationController
    def index
        @instructors = Instructor.all.order('created_at ASC')
        @instructor = Instructor.new
        @cohorts=Cohort.all.map{|cohort| [cohort.name, cohort.id]}
    end

    def new
        @instructor = Instructor.new
        @cohorts=Cohort.all.map{|cohort| [cohort.name, cohort.id]}
    end

    def show
        @instructor=Instructor.find(params[:id])
    end

    def create
        @instructor = Instructor.create(
            first_name: params[:instructor][:first_name],
            last_name: params[:instructor][:last_name],
            age: params[:instructor][:age],
            salary: params[:instructor][:salary],
            education: params[:instructor][:education],
            cohort_id: params[:instructor][:cohort_id]
            
        )
        redirect_to '/instructors'
    end

    def edit
        @instructor = Instructor.find(params[:id])
        @cohorts = Cohort.all
    end

    def update
        @instructor = Instructor.find(params[:id])
        @instructor.update(
            first_name: params[:instructor][:first_name],
            last_name: params[:instructor][:last_name],
            age: params[:instructor][:age],
            salary: params[:instructor][:salary],
            education: params[:instructor][:education],
            cohort_id: params[:instructor][:cohort_id]
        )
    end

    def destroy
        @instructor=Instructor.find(params[:id])
        @instructor.destroy
        respond_to do |format|
            format.html {redirect_to instructors_path}
            format.js 
        end
    end
end
