var peldge_year = document.getElementById("peldge_year");

peldge_year.onchange = recomputeRecommendedDonations;
function recomputeRecommendedDonations() {
  function computeAmount(scaleFactor) {
    let peldgeYear = parseInt(peldge_year.value);
    let currentYear = new Date().getUTCFullYear();
    if (peldgeYear >= currentYear) {
      return 0;
    }
    return (Math.trunc((currentYear - peldgeYear) / scaleFactor) + 1) * 22;
  }

  for (let tier of document.getElementsByClassName("recommended-donation")) {
    let factor = parseInt(tier.getAttribute("factor"));
    let value = computeAmount(factor);
    tier.textContent = `$${value} per month`;
  }

  for (let tier of document.getElementsByClassName("equivalent-donation")) {
    let factor = parseInt(tier.getAttribute("factor"));
    let value = computeAmount(factor);
    let waterBalloonCost = 0.016; // walmart sells 250 balloons for about $4

    // Assumption: input_goal * interest_rate = output_assumed (per year)
    let total_goal = 1222222; // total goal to be raised over 10 years
    let assumed_interest = 50000; // amount we assume we can get in interest
    let ten_years_funded = ((value * 12 * 10) / total_goal) * assumed_interest;

    // rough numbers for annual costs:
    let annual_insurance = 20000;
    let annual_property_tax = 40000;
    let annual_mortgage = 45000;

    let waterBalloons = Math.trunc(ten_years_funded / waterBalloonCost);

    let tax_fraction = Math.trunc(annual_property_tax / ten_years_funded);
    let mortgage_fraction = Math.trunc(annual_mortgage / ten_years_funded);
    let insurance_fraction = Math.trunc(annual_insurance / ten_years_funded);
    tier.innerHTML = `1/${tax_fraction} of the property tax (or ${waterBalloons} water balloons!)`;
  }
}
