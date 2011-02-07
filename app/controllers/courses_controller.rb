class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.xml
	
	respond_to :json
	
  def index
    @courses = Course.all
    session[:course_id] = nil

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @courses }
      format.json { render :json => @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.xml
  def show
    @course = Course.find(params[:id])
		session[:course_id] = @course.id
		
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course }
      format.json { render :json => @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.xml
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course }
      format.json { render :json => @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
    
    respond_to do |format| 
    	format.html # edit.html.erb
    	format.xml { render :xml => @course }
    	format.json { render :json => @course }
  	end
  end

  # POST /courses
  # POST /courses.xml
  def create
    @course = Course.new(params[:course])
		
    respond_to do |format|
      if @course.save
        format.html { redirect_to(@course, :notice => 'Course was successfully created.') }
        format.xml  { render :xml => @course, :status => :created, :location => @course }
	      format.json { render :json => @course, :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
	      format.json { render :json => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.xml
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to(@course, :notice => 'Course was successfully updated.') }
        format.xml  { head :ok }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
        format.json  { render :json => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.xml
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    session[:course_id] = nil

    respond_to do |format|
      format.html { redirect_to(courses_url) }
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end
end
