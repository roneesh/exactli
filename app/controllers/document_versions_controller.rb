class DocumentVersionsController < ApplicationController
  # GET /document_versions
  # GET /document_versions.json
  def index
    @document_versions = DocumentVersion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @document_versions }
    end
  end

  # GET /document_versions/1
  # GET /document_versions/1.json
  def show
    @document_version = DocumentVersion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document_version }
    end
  end

  # GET /document_versions/new
  # GET /document_versions/new.json
  def new
    @document_version = DocumentVersion.new
    @document_id = params[:document_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document_version }
    end
  end

  # GET /document_versions/1/edit
  def edit
    @document_version = DocumentVersion.find(params[:id])
    @document_id = @document_version.document_id
  end

  # POST /document_versions
  # POST /document_versions.json
  def create
    @document_version = DocumentVersion.new(params[:document_version])

    respond_to do |format|
      if @document_version.save
        format.html { redirect_to document_path(@document_version.document_id), notice: 'Document version was successfully created.' }
        format.json { render json: @document_version, status: :created, location: @document_version }
      else
        format.html { render action: "new" }
        format.json { render json: @document_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /document_versions/1
  # PUT /document_versions/1.json
  def update
    @document_version = DocumentVersion.find(params[:id])

    respond_to do |format|
      if @document_version.update_attributes(params[:document_version])
        format.html { redirect_to document_path(@document_version.document_id), notice: 'Document version was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_versions/1
  # DELETE /document_versions/1.json
  def destroy
    @document_version = DocumentVersion.find(params[:id])
    @document_version.destroy

    respond_to do |format|
      format.html { redirect_to document_path(@document_version.document_id) }
      format.json { head :no_content }
    end
  end

  def annotate
    @document_version = DocumentVersion.find_by_id(params[:id])
    @document = Document.find_by_id(@document_version.document_id)
    @document_versions = DocumentVersion.where(document_id: @document.id)
    @annotations = Annotation.where(document_version_id: params[:id])
  end
  
end
