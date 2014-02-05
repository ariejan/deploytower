require 'spec_helper'

describe TargetsController do
  describe 'GET #index' do
    let(:target) { build_stubbed :target }

    before do
      allow(Target).to receive(:all).and_return([target])
      get :index
    end

    it 'assigns an array of targets to @targets' do
      expect(assigns(:targets)).to match_array([target])
    end

    it 'renders the :index view' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:target) { build_stubbed :target }

    before do
      allow(Target).to receive(:find).and_return(target)
      get :show, id: target
    end

    it 'assigns the requested target to @target' do
      expect(assigns(:target)).to eql(target)
    end

    it 'renders the :show view' do
      expect(response).to render_template(:show)
    end

    describe "with deployments" do
      let(:deployment) { build_stubbed :deployment }

      before do
        allow(target).to receive(:deployments).and_return([deployment])
      end

      it "assigns target.deployments to @deployments" do
        get :show, id: target
        expect(assigns(:deployments)).to eql([deployment])
      end
    end
  end

  describe 'GET #new' do
    before do
      get :new
    end

    it 'assigns a new target to @target' do
      expect(assigns(:target)).to be_a_new(Target)
    end

    it 'render the :new view' do
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    let(:target) { build_stubbed :target }

    before do
      allow(Target).to receive(:find).and_return(target)
      get :edit, id: target
    end

    it 'assigns the requested target to @target' do
      expect(assigns(:target)).to eql(target)
    end

    it 'renders the :edit view' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    let(:target)     { build_stubbed :target }
    let(:attributes) { attributes_for(:target) }

    before do
      allow(Target).to receive(:new).and_return(target)
    end

    context 'with valid attributes' do
      before do
        allow(target).to receive(:save).and_return(true)
      end

      it 'saves the target to the database' do
        expect(target).to receive(:save)
        post :create, target: attributes
      end

      it 'sets the approiate attributes' do
        expect(Target).to receive(:new).with(attributes.stringify_keys)
        post :create, target: attributes
      end

      it 'redirects to the target page' do
        post :create, target: attributes
        expect(response).to redirect_to(target)
      end
    end

    context 'with invalid attributes' do
      before do
        allow(target).to receive(:save).and_return(false)
        post :create, target: attributes_for(:target)
      end

      it 'assigns target to @target' do
        expect(assigns(:target)).to eql(target)
      end

      it 're-renders the :new view' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    let(:target)     { build_stubbed :target }
    let(:attributes) { attributes_for(:target) }

    before do
      allow(Target).to receive(:find).and_return(target)
    end

    context 'with valid attributes' do
      before do
        allow(target).to receive(:save).and_return(true)
      end

      it 'assigns the target to @target' do
        put :update, id: target, target: attributes
        expect(assigns(:target)).to eql(target)
      end

      it 'updates the target to the database' do
        expect(target).to receive(:update).with(attributes.stringify_keys)
        put :update, id: target, target: attributes
      end

      it 'redirects to the target page' do
        put :update, id: target, target: attributes
        expect(response).to redirect_to(target)
      end
    end

    context 'with invalid attributes' do
      before do
        allow(target).to receive(:save).and_return(false)
      end

      it 'assigns the target to @target' do
        put :update, id: target, target: attributes
        expect(assigns(:target)).to eql(target)
      end

      it 're-renders the :edit view' do
        put :update, id: target, target: attributes
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:target) { build_stubbed :target }

    before do
      allow(Target).to receive(:find).and_return(target)
    end

    it 'removes the target from the database' do
      expect(target).to receive(:destroy)
      delete :destroy, id: target
    end

    it 'redirects back to the root url' do
      allow(target).to receive(:destroy)
      delete :destroy, id: target
      expect(response).to redirect_to('/')
    end
  end

  describe "POST #deploy" do
    let(:target) { build_stubbed :target }

    before do
      allow(Target).to receive(:find).and_return(target)
    end

    it 'creates a new queued deployment' do
      expect(target).to receive(:deploy!)
      post :deploy, id: target
    end

    it 'redirects back to the target' do
      allow(target).to receive(:deploy!)
      post :deploy, id: target
      expect(response).to redirect_to(target)
    end
  end
end
