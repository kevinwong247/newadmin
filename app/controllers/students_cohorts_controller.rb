class StudentsCohortsController < ApplicationController
    def new
        @students=Student.all.map{|student| [student.first_name, student.id] }
        @cohorts=Cohort.all.map{|cohort| [cohort.name, cohort.id]}
        @students_cohorts= StudentsCohort.new
    end

    def create
        StudentsCohort.create(
            student_id: params[:students_cohort][:student_id],
            cohort_id: params[:students_cohort][:cohort_id]
        )
        redirect_to students_path
    end

    def add_students_to_cohort
        @students_cohort=StudentsCohort.new
        @cohort=Cohort.find(params[:id])
        @students=Student.all.map{|student| [student.first_name, student.id] }
    end

    def create_students_cohort
        array=params[:create_students_cohort][:students_ids]
        array.map!(&:to_i)
        array=array[1..-1]
        array.each do |student_id|
        StudentsCohort.create(
            student_id: student_id,
            cohort_id: params[:students_cohort][:cohort_id]
        )
        end
    end

    def create_cohorts_student
        array=params[:cohorts]
        array.map!(&:to_i)
        array=array[1..-1]
        array.each do |cohort_id|
            puts cohort_id
            puts params[:student_id]
            puts "!!!!!!!!!!!!!!"
            StudentsCohort.create(
                cohort_id: cohort_id,
                student_id: params[:student_id]  
            )
        end
        redirect_to students_path
    end
end
