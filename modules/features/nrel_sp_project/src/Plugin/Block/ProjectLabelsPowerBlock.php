<?php

namespace Drupal\nrel_sp_project\Plugin\Block;

use Drupal\Core\Block\BlockBase;

/**
 * Provides a 'ProjectLabelsPowerBlock' block.
 *
 * @Block(
 *  id = "project_label_PowerBlock",
 *  admin_label = @Translation("Project Label: Power Block"),
 * )
 */
class ProjectLabelsPowerBlock extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {
    $build = [];
    $build['more_questions']['#markup'] = '<h3>Power Block</h3>';

    return $build;
  }

}
