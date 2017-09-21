<?php

namespace Drupal\nrel_sp_project\Plugin\Block;

use Drupal\Core\Block\BlockBase;

/**
 * Provides a 'ProjectLabelsThermalStorage' block.
 *
 * @Block(
 *  id = "project_label_ThermalStorage",
 *  admin_label = @Translation("Project Label: Thermal Storage"),
 * )
 */
class ProjectLabelsThermalStorage extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {
    $build = [];
    $build['more_questions']['#markup'] = '<h3>Thermal Storage</h3>';

    return $build;
  }

}
