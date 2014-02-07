class DeploymentDecorator < Draper::Decorator
  delegate_all

  def reference
    model.reference ? model.reference[0..8] : 'n/a'
  end

  def long_reference
    model.reference
  end

  def haml_object_ref
    model.class.to_s.underscore
  end
end
