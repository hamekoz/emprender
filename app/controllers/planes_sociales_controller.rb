class PlanesSocialesController < ApplicationController
  before_filter :autenticar
  
  # GET /planes_sociales
  # GET /planes_sociales.xml
  def index
    @planes_sociales = PlanSocial.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @planes_sociales }
    end
  end

  # GET /planes_sociales/1
  # GET /planes_sociales/1.xml
  def show
    @plan_social = PlanSocial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plan_social }
    end
  end

  # GET /planes_sociales/new
  # GET /planes_sociales/new.xml
  def new
    @plan_social = PlanSocial.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plan_social }
    end
  end

  # GET /planes_sociales/1/edit
  def edit
    @plan_social = PlanSocial.find(params[:id])
  end

  # POST /planes_sociales
  # POST /planes_sociales.xml
  def create
    @plan_social = PlanSocial.new(params[:plan_social])

    respond_to do |format|
      if @plan_social.save
        format.html { redirect_to(@plan_social, :notice => 'Plan social was successfully created.') }
        format.xml  { render :xml => @plan_social, :status => :created, :location => @plan_social }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plan_social.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /planes_sociales/1
  # PUT /planes_sociales/1.xml
  def update
    @plan_social = PlanSocial.find(params[:id])

    respond_to do |format|
      if @plan_social.update_attributes(params[:plan_social])
        format.html { redirect_to(@plan_social, :notice => 'Plan social was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plan_social.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /planes_sociales/1
  # DELETE /planes_sociales/1.xml
  def destroy
    @plan_social = PlanSocial.find(params[:id])
    @plan_social.destroy

    respond_to do |format|
      format.html { redirect_to(planes_sociales_url) }
      format.xml  { head :ok }
    end
  end
end
