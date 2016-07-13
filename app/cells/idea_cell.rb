class IdeaCell < Cell::ViewModel
  include ::Cell::Hamlit
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::CaptureHelper

  property :name
  property :description
  
  def show
    render
  end
end
