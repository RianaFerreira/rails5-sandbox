class IdeaCell < Cell::ViewModel
  def show
    property :name
    property :description

    render
  end
end
