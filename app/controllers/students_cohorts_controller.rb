class StudentsCohortsController < ApplicationController
    def index
        @students_cohort = StudentsCohort.all


    end
  
    def show
      @students_cohort = StudentsCohort.all
    end
  
    def edit
      @students_cohort = StudentsCohort.find(params[:id])
      @student = Student.all.map{|r| [r.first_name, r.id]}
      @cohort = Cohort.all.map{|t| [t.name, t.id]}
    end
  
    def update
      @students_cohort = StudentsCohort.find(params[:id])
      @cohort = Cohort.all.map{|q| [q.name, q.id]}
      @students_cohort.update(student_cohorts_params)
      redirect_to '/student_cohorts/show'
    end
  
    def destroy
      @students_cohort = StudentsCohort.find(params[:id])
      @students_cohort.destroy
      respond_to do |format|
        format.js
      end
    end
  
    def new
      @students_cohort = StudentsCohort.new
      @student = Student.all.map{ |t| [t.id]}
      @cohort = Cohort.all.map{|g| [g.id]}
    end
  
    def create
      StudentsCohort.create(
          cohort_id: params[:students_cohort][:cohort_id],
          student_id: params[:students_cohort][:student_id]
        )

      redirect_to '/students_cohorts/show'
    end
  
    private
  
   
end