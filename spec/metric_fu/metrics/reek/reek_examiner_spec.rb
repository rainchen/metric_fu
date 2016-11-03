require 'spec_helper'
require 'yaml'

describe MetricFu::ReekExaminer do
  context 'get the right reek examiner' do

    let(:options) { { dirs_to_reek: [] } }
    let(:files_to_analyze) { ['lib/metric_fu/version.rb'] }

    before :each do
      allow(ReekExaminer).to receive(:reek_examinor_klass).and_return(class_double('Reek::Examiner'))
    end

    it 'Reek version ~1.0 creates a ReekExaminerV1 object' do
      allow(ReekExaminer).to receive(:reek_version).and_return('1.6.6')
      examiner = MetricFu::ReekExaminer.get
      expect(examiner).to be_a(MetricFu::ReekExaminer::ReekExaminerV1)
    end

    it 'Reek version ~2.0 creates a ReekExaminerV1 object' do
      allow(ReekExaminer).to receive(:reek_version).and_return('2.2.1')
      examiner = MetricFu::ReekExaminer.get
      expect(examiner).to be_a(MetricFu::ReekExaminer::ReekExaminerV1)
    end

    it 'Reek version ~3.0 creates a ReekExaminerV3 object' do
      allow(ReekExaminer).to receive(:reek_version).and_return('3.11')
      examiner = MetricFu::ReekExaminer.get
      expect(examiner).to be_a(MetricFu::ReekExaminer::ReekExaminerV3)
    end

    it 'Reek version ~4.0 creates a ReekExaminerV4 object' do
      allow(ReekExaminer).to receive(:reek_version).and_return('4.1.0')
      examiner = MetricFu::ReekExaminer.get
      expect(examiner).to be_a(MetricFu::ReekExaminer::ReekExaminerV4)
    end
  end

  context 'Analyse Reek Examiner' do
    describe 'Reek V1' do
      let(:output) {
        gem 'reek', '~> 1.0'
        fixture_file = FIXTURE.fixtures_path.join('reek', 'examiner_1.6.6.yml').to_s
        YAML::load_file(fixture_file)
      }

      it 'analyse parses to propper mf_reek model' do
        pending
        sut = MetricFu::ReekExaminer::ReekExaminerV1.new(double)
        sut.instance_variable_set(:@output, output)
        expect(sut.analyze).to eq([])
      end
    end

    describe 'Reek V2' do
      let(:output) {
        gem 'reek', '~> 2.0'
        fixture_file = FIXTURE.fixtures_path.join('reek', 'examiner_2.2.1.yml').to_s
        YAML::load_file(fixture_file)
      }

      it 'analyse parses to propper mf_reek model' do
        pending
        sut = MetricFu::ReekExaminer::ReekExaminerV1.new(double)
        sut.instance_variable_set(:@output, output)
        expect(sut.analyze).to eq([])
      end
    end

    describe 'Reek V3' do
      let(:output) {
        gem 'reek', '~> 3.0'
        fixture_file = FIXTURE.fixtures_path.join('reek', 'examiner_3.11.yml').to_s
        YAML::load_file(fixture_file)
      }

      it 'analyse parses to propper mf_reek model' do
        pending
        sut = MetricFu::ReekExaminer::ReekExaminerV3.new(double)
        sut.instance_variable_set(:@output, output)
        expect(sut.analyze).to eq([])
      end
    end

    describe 'Reek V4' do
      let(:output) {
        gem 'reek', '~> 4.0'
        fixture_file = FIXTURE.fixtures_path.join('reek', 'examiner_4.1.0.yml').to_s
        YAML::load_file(fixture_file)
      }

      it 'analyse parses to propper mf_reek model' do
        pending
        sut = MetricFu::ReekExaminer::ReekExaminerV4.new(double)
        sut.instance_variable_set(:@output, output)
        expect(sut.analyze).to eq([])
      end
    end
  end
end