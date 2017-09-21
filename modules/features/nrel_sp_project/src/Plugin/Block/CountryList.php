<?php

namespace Drupal\nrel_sp_project\Plugin\Block;

use Drupal\Core\Block\BlockBase;
use Drupal\Core\Link;
use Drupal\Core\Url;

/**
 * Provides a 'CountryList' block.
 *
 * @Block(
 *  id = "country_list",
 *  admin_label = @Translation("Country list"),
 * )
 */
class CountryList extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {
    $build = [];
    $country_list = get_project_countries_alphabetical();

    $country_links = [];
    foreach($country_list as $countryname => $countrycode) {

      $url = Url::fromUri("internal:/by-country/" . $countrycode);

      $link = Link::fromTextAndUrl($countryname, $url);

      $country_links[] = $link->toString();
    }

    $render = [
      '#theme' => 'item_list',
      '#items' => $country_links,
    ];

    $build['country_list']['#markup'] = \Drupal::service('renderer')->render($render);

    return $build;
  }

}

function get_project_countries_alphabetical() {
  $query = \Drupal::database()->select('node__field_address', 'nfa');
  $query->distinct();
  $query->fields('nfa', array('field_address_country_code'));
  $project_countries = $query->execute()->fetchCol();

  $country_codes = \Drupal\Core\Locale\CountryManager::getStandardList();

  $final_country_list = [];
  foreach ($country_codes AS $country_code => $country) {
    if (in_array($country_code, $project_countries)) {
      $final_country_list[$country->render()] = $country_code;
    }
  }
  ksort($final_country_list);
  return $final_country_list;
}