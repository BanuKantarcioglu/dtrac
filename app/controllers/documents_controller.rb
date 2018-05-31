class DocumentsController < ApplicationController

  def create
      @personnel = Personnel.find(params[:personnel_id])
      @document = @personnel.documents.create(document_params)
      redirect_to personnel_path(@personnel)
  end

  def destroy
      @personnel = Personnel.find(params[:personnel_id])
      @document = @personnel.documents.find(params[:id])
      @document.destroy
      redirect_to personnel_path(@personnel)
  end

    private
      def document_params
        params.require(:document).permit(:name, :startdate,:enddate,:status)
      end

end
