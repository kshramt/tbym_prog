# -*- coding: utf-8 -*-
require 'kshramt'

# ~/.config/displacement_after/config.yamlを編集することで、コンパイラなどを変更できる。
CONFIG = Class.new.class_eval{
  include ::Kshramt::Config
}.new('displacement_after', rake: 'rake1.9', open: 'open')

# srcディレクトリのRakefileに委譲される
[
 :compile
].each{|t|
  desc "Delegated task."
  task t do
    FileUtils.cd('src'){sh "#{CONFIG.rake} #{t}"}
  end
}

desc "コンパイルしてからテストする"
task test: :compile do
  FileUtils.cd('test'){
    sh "../bin/displacement_after.exe"
    sh "../bin/plot_displacement_after.bash > tmp.eps && epstopdf tmp.eps && #{CONFIG.open} tmp.pdf"
  }
end

task default: :test
