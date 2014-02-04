require 'spec_helper'

describe TargetsController do
  describe "GET #index" do
    it "assigns an array of targets to @targets" do
      target = create(:target)
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
    context "with valid attributes" do
      it "saves the target to the database" do
        expect {
          post :create, target: attributes_for(:target)
        }.to change(Target, :count).by(1)
      end

      it "redirects to the target page" do
        post :create, target: attributes_for(:target)
        expect(response).to redirect_to(Target.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the target to the database" do
        expect {
          post :create, target: attributes_for(:invalid_target)
        }.not_to change(Target, :count)
      end

      it "re-renders the :new view" do
        post :create, target: attributes_for(:invalid_target)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    it "assigns the requested target to @target"
    it "renders the :edit view"
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "updates the target to the database"
      it "redirects to the target page"
    end

    context "with invalid attributes" do
      it "does not update the target to the database"
      it "re-renders the :edit view"
    end
  end

  describe "DELETE #destroy" do
    it "removes the target from the database"
    it "redirect to the root url"
  end
end
