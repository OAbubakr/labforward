shared_context "zscore calculator" do |type|
  context 'empty input' do
    let(:args) { { data: [], threshold: 1 } }
    it 'should return empty array' do
      expect(subject).to eq []
    end
  end

  context 'zero variance' do
    context 'all equal' do
      let(:args) do
        value = rand(10)
        { data: Array.new(5){ value }, threshold: 1 }
      end
      it 'should return all zeroes' do
        expect(subject).to eq Array.new(5) { 0 }
      end
    end

    context 'value equal mean' do
      let(:args) do
        arr = Array.new(4){ rand(4) }
        # calculating last value to be equal mean, ensuting 0 variance
        last_value = arr.sum.to_f / arr.count
        arr << last_value
        { data: arr, threshold: 1 }
      end

      it 'should return zero in last element' do
        expect(subject.last).to be_zero
      end
    end
  end

  context 'normal cases' do
    let(:args) { { data: data, threshold: threshold } }
    samples = JSON.parse(Rails.root.join("spec/fixtures/files/z_score_samples.json").read, symbolize_names: true)
    samples.each.with_index do |sample, index|
      context "sample #{index}" do
        let(:data) { sample[:input] }
        let(:threshold) { sample[:threshold] }
        let(:expected_result) { sample[type] }
        it 'should return correct results' do
          expect(subject).to eq expected_result
        end
      end
    end
  end
end
