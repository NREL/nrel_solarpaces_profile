<?php
/**
 * @file
 * Contains \Drupal\nrel_sp_project\Plugin\Block\ProjectMap.
 */

namespace Drupal\nrel_sp_project\Plugin\Block;

use Drupal\Core\Block\BlockBase;

/**
 * Provides a 'project map' block.
 *
 * @Block(
 *   id = "project_map",
 *   admin_label = @Translation("Project Map"),
 *   category = @Translation("Google Map to navigate Project Content")
 * )
 */
class ProjectMap extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {

    $country_manager = \Drupal::service('address.country_repository')
      ->getList();

    $query = \Drupal::database()->select('node__field_address', 'nfa');
    $query->addExpression('COUNT(*)', 'count');
    $query->distinct();
    $query->addField('nfa', 'field_address_country_code');
    $query->groupBy('field_address_country_code');
    $result = $query->execute();

    $country_data = '';
    $delimeter = '';
    foreach ($result as $item) {
      $country_code = $item->field_address_country_code;
      $country_name = $country_manager[$country_code];
      $project_count = $item->count;
      $country_data .= "{$delimeter}[{v:'{$country_code}',f:'{$country_name}'}, 0, '{$project_count} projects']";

      $delimeter = ', ';
    }

    return [
      '#theme' => 'projectmap',
      '#countrydata' => $country_data,
    ];
  }
}
