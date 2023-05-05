# frozen_string_literal: true

describe UpdatesController do
  describe 'GET #index' do
    let(:project) { create(:project) }

    it 'fills project variable' do
      get :index, params: { project_id: project.id }
      expect(assigns(:project)).to eq(project)
    end

    it 'renders proper template' do
      get :index, params: { project_id: project.id }
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    let(:project) { create(:project) }

    it 'fills project variable' do
      post :create, params: { project_id: project.id, update: attributes_for(:update) }
      expect(assigns(:project)).to eq(project)
    end

    it 'created update entity' do
      expect { post :create, params: { project_id: project.id, update: attributes_for(:update) } }
        .to change(project.updates, :count).by(1)
    end

    it "doesn't change project status if posted a comment" do
      project.update!(status: 'initiated')
      post :create, params: { project_id: project.id, update: attributes_for(:update) }
      project.reload
      expect(project.status).to eq 'initiated'
    end

    it 'changes project status if posted a status change' do
      project.update!(status: 'initiated')
      post :create, params: {
        project_id: project.id,
        update: attributes_for(:update, kind: 'change_status', status: 'executed')
      }
      project.reload
      expect(project.status).to eq 'executed'
    end

    it 'redirects back to the project' do
      post :create, params: { project_id: project.id, update: attributes_for(:update) }
      expect(response).to redirect_to project_updates_path(project)
    end
  end
end
