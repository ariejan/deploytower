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
    it "assigns the requested target to @target"
    it "renders the :show view"
  end

  describe "GET #new" do
    it "assigns a new target to @target"
    it "render the :new view"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the target to the database"
      it "redirects to the target page"
    end

    context "with invalid attributes" do
      it "does not save the target to the database"
      it "re-renders the :new view"
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
