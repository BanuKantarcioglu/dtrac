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

  def pastdue
    @documents = Document.where('enddate < ?' ,Time.now).order(' enddate')
    @myheader = "#{@documents.count} documents past due as of date : #{Time.now.strftime("%d/%m/%Y")}"

    render 'reports'
  end

  def duesoon
    #@documents = Document.where(enddate: Time.now..Time.now + 2592000 ).order(' enddate')
    @documents = Document.joins(:personnel).where(documents: {enddate: Time.now..Time.now + 2592000}).order(' enddate')
    @myheader = "#{@documents.count} documents due in a month : #{(Time.now + 2592000).strftime("%d/%m/%Y") }"
    render 'reports'
  end

    private
      def document_params
        params.require(:document).permit(:name, :startdate,:enddate,:status)
      end

end
