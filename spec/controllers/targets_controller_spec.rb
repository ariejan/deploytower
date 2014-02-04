require 'spec_helper'

describe TargetsController do
  describe "GET #index" do
    let(:target) { create :target }

    before do
      allow(Target).to receive(:all).and_return([target])
    end

    it "assigns an array of targets to @targets" do
      get :index
      expect(assigns(:targets)).to match_array([target])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    let(:target) { create :target }

    before do
      allow(Target).to receive(:find).and_return(target)
    end

    it "assigns the requested target to @target" do
      get :show, id: target
      expect(assigns(:target)).to eql(target)
    end

    it "renders the :show view" do
      get :show, id: target
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "assigns a new target to @target" do
      get :new
      expect(assigns(:target)).to be_a_new(Target)
    end

    it "render the :new view" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    let(:target) { build :target }

    before do
      allow(Target).to receive(:new).and_return(target)
    end

    context "with valid attributes" do
      it "saves the target to the database" do
        expect(target).to receive(:save)
        post :create, target: attributes_for(:target)
      end

      it "redirects to the target page" do
        post :create, target: attributes_for(:target)
        expect(response).to redirect_to(Target.last)
      end
    end

    context "with invalid attributes" do
      before do
        allow(target).to receive(:save).and_return(false)
      end

      it "assigns @target a new record" do
        post :create, target: attributes_for(:target)
        expect(assigns(:target)).to be_a_new(Target)
      end

      it "re-renders the :new view" do
        post :create, target: attributes_for(:target)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    let(:target) { create :target }

    it "assigns the requested target to @target" do
      get :edit, id: target
      expect(assigns(:target)).to eql(target)
    end

    it "renders the :edit view" do
      get :edit, id: target
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    let(:target)     { create :target }
    let(:attributes) { attributes_for(:target) }

    before do
      allow(Target).to receive(:find).and_return(target)
    end

    context "with valid attributes" do
      it "assigns the target to @target" do
        put :update, id: target, target: attributes
        expect(assigns(:target)).to eql(target)
      end

      it "updates the target to the database" do
        expect(target).to receive(:update).with(attributes.stringify_keys)
        put :update, id: target, target: attributes
      end

      it "redirects to the target page" do
        put :update, id: target, target: attributes
        expect(response).to redirect_to(target)
      end
    end

    context "with invalid attributes" do
      before do
        allow(target).to receive(:save).and_return(false)
      end

      it "assigns the target to @target" do
        put :update, id: target, target: attributes
        expect(assigns(:target)).to eql(target)
      end

      it "re-renders the :edit view" do
        put :update, id: target, target: attributes
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:target)     { create :target }

    before do
      allow(Target).to receive(:find).and_return(target)
    end

    it "removes the target from the database" do
      expect(target).to receive(:destroy)
      delete :destroy, id: target
    end

    it "redirects back to the root url" do
      delete :destroy, id: target
      expect(response).to redirect_to("/")
    end
  end
end
