class Paasta < Formula
  include Language::Python::Virtualenv

  desc "A highly-available, distributed system for building, deploying, and running services using containers and Apache Mesos"
  url "https://github.com/Yelp/paasta/archive/v0.46.4.tar.gz"
  sha256 "9bc7f155c77c3e78c68b3e1c942a836370d20a45687af83a838769c4a0b330d2"

  def install
    venv = virtualenv_create(libexec, "python2.7")
    venv.pip_install_and_link buildpath
    # the Virtualenv object's pip install forces --no-deps, which is really annoying for Paasta, as our
    # requirements.txt does not specify all recursive dependencies, so here we run the pip command we actually want.
    system venv.instance_variable_get(:@venv_root)/"bin/pip", "install", "-r#{buildpath}/requirements.txt"
  end
end
