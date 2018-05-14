<?php

namespace Drupal\nrel_sp_project\Plugin\Block;

use Drupal\Core\Block\BlockBase;
use Drupal\Core\Link;
use Drupal\Core\Url;
use Drupal\Core\Locale;

/**
 * Provides a 'ProjectOverviewTable' block.
 *
 * @Block(
 *  id = "project_label_ProjectOverviewTable",
 *  admin_label = @Translation("Project Overview Table"),
 * )
 */
class ProjectOverviewTable extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {
    $build = [];
    $node = \Drupal::routeMatch()->getParameter('node');
    if($node != NULL) {

      $address = $node->get('field_address')->getValue();
      $countries = \Drupal\Core\Locale\CountryManager::getStandardList();
      $country = $countries[$address[0]['country_code']];
      if (isset($address[0]['administrative_area']) && preg_match('/\w+/', $address[0]['administrative_area'])) {
        $province = $address[0]['administrative_area'];
      }
      $build['project_overview']['#markup'] = '<table>';
      $build['project_overview']['#markup'] .= '<tr>
        <td width="50%" class="first-cell">Project Name:</td>
        <td width="50%" class="last-cell">' . $node->getTitle() . ($node->get('field_short_name')->getValue() != NULL && count($node->get('field_short_name')->getValue()) > 0 ? ' (' . $node->get('field_short_name')->getValue()[0]['value'] . ')' : '') . '</td>
      </tr>';
      $build['project_overview']['#markup'] .= '<tr>
        <td width="50%" class="first-cell">Location:</td>
        <td width="50%" class="last-cell">' .
      (isset($country) ? $country->render() : '')
        .
        (isset($province) ? "<br>($province)" : '')
        . '</td>
      </tr>';
      if (isset($address[0]['locality']) && $address[0]['locality'] <> '' && isset($address[0]['administrative_area']) && $address[0]['administrative_area'] <> '') {
        $build['project_overview']['#markup'] .= '<tr>
        <td width="50%" class="first-cell">Location:</td>
        <td width="50%" class="last-cell">' . $address[0]['locality'] . ' (' . $address[0]['administrative_area'] . ')</td>
      </tr>';
      }
      if (count($node->get('field_owners')->getValue()) > 0) {
        $owners = $node->get('field_owners')->referencedEntities();
        $owner_info = '';
        $delimeter = '';
        $percent = false;
        foreach($owners as $ownerkey => $ownervalue) {
          $owner_info .= $delimeter;
          $owner_info .= (isset($owners[$ownerkey]->field_owner) ? $owners[$ownerkey]->field_owner->value : '');
          if(isset($owners[$ownerkey]->field_owner_percent->value) && $owners[$ownerkey]->field_owner_percent->value != '') {
            $percent = $owners[$ownerkey]->field_owner_percent->value;
            $owner_info .=  " (" . $percent . "%)";
          }
          $delimeter = '<br />';
        }
        if (isset($owner_info) && preg_match('/\w/', $owner_info)) {
          $build['project_overview']['#markup'] .= '<tr>
        <td width="50%" class="first-cell">Owner(s)' . ($percent ? ' (%)' : '') . ':</td>
        <td width="50%" class="last-cell">' . $owner_info . '</td>
      </tr>';
        }
      }
      if (count($node->get('field_technology')->getValue()) > 0) {
        $technology = \Drupal\taxonomy\Entity\Term::load($node->get('field_technology')->getValue()[0]['target_id']);
        $technology = Link::fromTextAndUrl($technology->getName(), Url::fromUri("internal:/by-technology/{$node->get('field_technology')->getValue()[0]['target_id']}"));

        $build['project_overview']['#markup'] .= '<tr>
        <td width="50%" class="first-cell">Technology:</td>
        <td width="50%" class="last-cell">' . $technology->toString() . '</td>
      </tr>';
      }
      if (count($node->get('field_net_capacity')->getValue()) > 0) {
        $field = $node->field_net_capacity->view('full');
        $field['#label_display'] = 'hidden';
        $build['project_overview']['#markup'] .= '<tr>
        <td width="50%" class="first-cell">' . $field['#title'] . ':</td>
        <td width="50%" class="last-cell">' . render($field) . '</td>
      </tr>';
      }
      if (count($node->get('field_gross_turbine_capacity')->getValue()) > 0) {
        $field = $node->field_gross_turbine_capacity->view('full');
        $field['#label_display'] = 'hidden';
        $build['project_overview']['#markup'] .= '<tr>
        <td width="50%" class="first-cell">' . $field['#title'] . ':</td>
        <td width="50%" class="last-cell">' . render($field) . '</td>
      </tr>';
      }
      if (count($node->get('field_status')->getValue()) > 0) {
        $status = \Drupal\taxonomy\Entity\Term::load($node->get('field_status')
          ->getValue()[0]['target_id']);
        $status = Link::fromTextAndUrl($status->getName(), Url::fromUri("internal:/by-status/{$node->get('field_status')->getValue()[0]['target_id']}"));
        $build['project_overview']['#markup'] .= '<tr>
        <td width="50%" class="first-cell">Status:</td>
        <td width="50%" class="last-cell">' . $status->toString() . '</td>
      </tr>';
      }
      if (count($node->get('field_production_start_date')->getValue()) > 0) {
        $build['project_overview']['#markup'] .= '<tr>
        <td width="50%" class="first-cell">Start Year:</td>
        <td width="50%" class="last-cell">' . date("Y", strtotime($node->get('field_production_start_date')->getValue()[0]['value'])) . '</td>
      </tr>';
      }
      $build['project_overview']['#markup'] .= '</table>';
    }
    return $build;
  }

}
