class AnnotationController < ApplicationController
  def create
    Annotation.create(document_version_id: params[:id], content: params[:content], xcoor: params[:xcoor], ycoor: params[:ycoor], number: params[:number])
    
  end

  def destroy
  end
end
