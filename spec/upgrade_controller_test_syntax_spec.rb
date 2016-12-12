require_relative 'spec_helper'

describe RubySyntaxUpgrader::UpgradeControllerTestSyntax do

  let!(:old_controller_example) do
    """
      get :index
      get :index, :store => 1
      post :index, :store => '1'
      patch :index, :store => store.id
      put :index, :store => store.id
      delete :index, :store => store.id
      get :index, :store => store.id, :box_type => box_type.id
      get :index, store: store.id, box_type: box_type.id
      get :index, :store => store.id, :sort => 'box_type', :direction => 'desc'
      put :update, id: 9999
      put :update, params: { id: 9999 }
      put :update, :id => reservation.id, :reservation => 
        { :box_type_id => store.box_type.id }
    """
  end

  let!(:new_controller_example) do
    """
      get :index
      get :index, params: { :store => 1 }
      post :index, params: { :store => '1' }
      patch :index, params: { :store => store.id }
      put :index, params: { :store => store.id }
      delete :index, params: { :store => store.id }
      get :index, params: { :store => store.id, :box_type => box_type.id }
      get :index, params: { store: store.id, box_type: box_type.id }
      get :index, params: { :store => store.id, :sort => 'box_type', :direction => 'desc' }
      put :update, id: 9999
      put :update, params: { id: 9999 }
      put :update, params: { :id => reservation.id, :reservation => 
        { :box_type_id => store.box_type.id } }
    """
  end

  let(:example_path) { './spec/temp' }
  let(:example_file) { "#{example_path}/example_file.rb" }

  before do
    @source = File.open(example_file, 'w') do |f|
                f.write(old_controller_example)
              end
  end

  after do
    File.open(example_file, 'w') do |f|
      f.write('')
    end
  end

end