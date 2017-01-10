require_relative 'spec_helper'

describe RubySyntaxUpgrader::UpgradeControllerTestSyntax do

  describe '#replace' do
    subject { RubySyntaxUpgrader::UpgradeControllerTestSyntax.new }

    context 'when nil is passed' do
      it 'returns nil' do
        expect(subject.replace(nil)).to be_nil
      end
    end

    it 'does not need to replace since params were not passed' do
      expect(subject.replace('get :index')).to eq 'get :index'
    end

    context 'with params using new column syntax' do
      it 'replaces with numeric value' do
        expect(subject.replace("get :index, store: 1")).to eq "get :index, params: { store: 1 }"
      end

      it 'replaces with string value' do
        expect(subject.replace("get :index, store: '1'")).to eq "get :index, params: { store: '1' }"
      end

      it 'replaces with a variable(method call) value' do
        expect(subject.replace("get :index, store: store.id")).to eq "get :index, params: { store: store.id }"
      end

      it 'replaces with multiple variables values' do
        expect(subject.replace("get :index, store: store.id, box_type: box_type.id")).to eq "get :index, params: { store: store.id, box_type: box_type.id }"
      end

      it 'replaces with multiple variables with different type of values' do
        expect(subject.replace("get :index, store: store.id, sort: 'asc'")).to eq "get :index, params: { store: store.id, sort: 'asc' }"
      end

      it 'replaces with any http method and any digit number' do
        expect(subject.replace("get :put, id: 9999")).to eq "get :put, params: { id: 9999 }"
      end

      xit 'does not replace when param already exist' do
        expect(subject.replace("put :update, params: { id: 9999 }")).to eq "put :update, params: { id: 9999 }"
      end

      it 'replaces when call has multiple lines' do
        expect(subject.replace("""put :update, id: reservation.id, reservation: \
        { box_type_id: store.box_type.id }""")).to eq """put :update, params: { id: reservation.id, reservation: \
        { box_type_id: store.box_type.id } }"""
      end

    end

    context 'with params using hash rocket style' do
      
    end

  end

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

end