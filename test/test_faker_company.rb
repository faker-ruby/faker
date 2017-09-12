require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerCompany < Test::Unit::TestCase
  def setup
    @tester = Faker::Company
  end

  def test_ein
    assert @tester.ein.match(/\d\d-\d\d\d\d\d\d\d/)
  end

  def test_duns_number
    assert @tester.duns_number.match(/\d\d-\d\d\d-\d\d\d\d/)
  end

  def test_logo
    assert @tester.logo.match(%r{https://pigment.github.io/fake-logos/logos/medium/color/\d+\.png})
  end

  def test_buzzword
    assert @tester.buzzword.match(/\w+\.?/)
  end

  def test_swedish_organisation_number
    org_no = @tester.swedish_organisation_number
    assert org_no.match(/\d{10}/)
    assert [1, 2, 3, 5, 6, 7, 8, 9].include?(org_no[0].to_i)
    assert org_no[2].to_i >= 2
    assert org_no[9] == @tester.send(:luhn_algorithm, org_no[0..8]).to_s
  end

  def test_french_siren_number
    siren = @tester.french_siren_number
    assert siren.match(/\A\d{9}\z/)
    assert siren[8] == @tester.send(:luhn_algorithm, siren[0..-2]).to_s
  end

  def test_french_siret_number
    siret = @tester.french_siret_number
    assert siret.match(/\A\d{14}\z/)
    assert siret[8] == @tester.send(:luhn_algorithm, siret[0..7]).to_s
    assert siret[13] == @tester.send(:luhn_algorithm, siret[0..-2]).to_s
  end

  def test_norwegian_organisation_number
    org_no = @tester.norwegian_organisation_number
    assert org_no.match(/\d{9}/)
    assert [8, 9].include?(org_no[0].to_i)
    assert org_no[8] == @tester.send(:mod11, org_no[0..7]).to_s
  end

  def test_australian_business_number
    abn = @tester.australian_business_number
    checksum = abn_checksum(abn)

    assert abn.match(/\d{11}/)
    assert checksum % 89 == 0
  end

  def test_profession
    assert @tester.profession.match(/[a-z ]+\.?/)
  end

  private

    def abn_checksum(abn)
      abn_weights = [10, 1, 3, 5, 7, 9, 11, 13, 15, 17, 19]

      abn.split('').map(&:to_i).each_with_index.map do |n, i|
        (i == 0 ? n-1 : n) * abn_weights[i]
      end.inject(:+)
    end

end
