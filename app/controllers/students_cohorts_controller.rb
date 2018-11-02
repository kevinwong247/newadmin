class StudentsCohortsController < ApplicationController
    def new
       @students_cohort = Students_cohort.new
       @cohorts = Cohorts.all
    end

    def create
        Students_cohort.create(
            cohort_id: params[:students_cohorts][:cohort_id],
            student_id: params[:students_cohorts][:student_id]
           
        )
    end




   
   
end
