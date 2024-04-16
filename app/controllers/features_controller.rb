class FeaturesController < ApplicationController
  def index
    @features = Feature.all
    # Renderizar la vista HTML en lugar de devolver JSON
    # render json: features, each_serializer: FeatureSerializer
    # Si tu vista HTML se llama index.html.erb y está en el directorio app/views/features, 
    # simplemente puedes usar:
    # render 'index'
  end

  # Otras acciones del controlador...
end
