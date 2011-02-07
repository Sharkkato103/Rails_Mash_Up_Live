class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.xml 
	
#  def index
#    @questions = Question.all
#    session[:question_id] = nil

#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @questions }
#    end
#  end
	skip_before_filter :verify_authenticity_token
	respond_to :json

	before_filter :course_init
	def course_init
		@course ||= current_course
	end
	
  # GET /questions/1
  # GET /questions/1.xml
  def show
    @question = Question.find(params[:id])
    session[:question_id] = @question.id
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
      format.json { render :json => @question}
    end
  end

  # GET /questions/new
  # GET /questions/new.xml
  def new
  	@question = Question.new
		@question.course_id = @course.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
      format.json { render :json => @question}
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # edit.html.erb
      format.xml  { render :xml => @question }
      format.json { render :json => @question}
    end
  end

  # POST /questions
  # POST /questions.xml
  def create
    @question = Question.new(params[:question])
		@question.course_id = @course.id
		
    respond_to do |format|
      if @question.save
        format.html { redirect_to(@question, :notice => 'Question was successfully created.') }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
        format.json  { render :json => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
        format.json  { render :json => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.xml
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to(@question, :notice => 'Question was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
				format.json  { render :json => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.xml
  def destroy
    @question = Question.find(params[:id])
    Response.find_all_by_question_id(@question.id).each do |response| 
  		response.destroy
		end
    @question.destroy
    session[:question_id] = nil

    respond_to do |format|
      format.html { redirect_to(current_course) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
