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

    let waterBalloons = value / waterBalloonCost;
    let mortgage = 7500;
    let mortageFraction = Math.trunc(mortgage / value);

    tier.textContent = `${waterBalloons} water balloons, or 1/${mortageFraction}th of the monthly mortgage`;
  }
}
