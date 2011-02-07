class ResponsesController < ApplicationController
  # GET /responses
  # GET /responses.xml
  
  respond_to :json
  
#  def index
#    @responses = Response.all

#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @responses }
#    end
#  end

  # GET /responses/1
  # GET /responses/1.xml
  def show
    @response = Response.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @response }
      format.json { render :json => @response }
    end
  end

  # GET /responses/new
  # GET /responses/new.xml
  
	
  def new
  	@question = current_question
    @response = Response.new
    @response.question_id = @question.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @response }
      format.json { render :json => @response }
    end
  end

  # GET /responses/1/edit
  def edit
  	@question = current_question
    @response = Response.find(params[:id])
    respond_to do |format|
      format.html # edit.html.erb
      format.xml  { render :xml => @response }
      format.json { render :json => @response }
    end
  end

  # POST /responses
  # POST /responses.xml
  def create
  	@question = current_question
    @response = Response.new(params[:response])
    @response.question_id = @question.id

    respond_to do |format|
      if @response.save
        format.html { redirect_to(@question, :notice => 'Response was successfully created.') }
        format.xml  { render :xml => @response, :status => :created, :location => @response }
        format.json  { render :json => @response, :status => :created, :location => @response }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @response.errors, :status => :unprocessable_entity }
        format.json  { render :json => @response.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /responses/1
  # PUT /responses/1.xml
  def update
  	@question = current_question
    @response = Response.find(params[:id])

    respond_to do |format|
      if @response.update_attributes(params[:response])
        format.html { redirect_to(@question, :notice => 'Response was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @response.errors, :status => :unprocessable_entity }
        format.json  { render :json => @response.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.xml
  def destroy
		@question = current_question
		@response = Response.find(params[:id])
    @response.destroy

    respond_to do |format|
      format.html { redirect_to(@question) }
      format.xml  { head :ok }
			format.json  { head :ok }
    end
  end
end
