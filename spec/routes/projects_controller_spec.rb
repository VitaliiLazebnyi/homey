# frozen_string_literal: true

describe ProjectsController, type: :routing do
  it {
    expect(get: '/')
      .to route_to(controller: 'projects', action: 'index')
  }

  it {
    expect(get: '/projects')
      .to route_to('controller' => 'projects', 'action' => 'index')
  }
end
