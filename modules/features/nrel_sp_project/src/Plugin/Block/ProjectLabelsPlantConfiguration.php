<?php

namespace Drupal\nrel_sp_project\Plugin\Block;

use Drupal\Core\Block\BlockBase;

/**
 * Provides a 'ProjectLabelsPlantConfiguration' block.
 *
 * @Block(
 *  id = "project_label_PlantConfiguration",
 *  admin_label = @Translation("Project Label: Plant Configuration"),
 * )
 */
class ProjectLabelsPlantConfiguration extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {
    $build = [];
    $build['more_questions']['#markup'] = '<h2>Plant Configuration</h2>';

    return $build;
  }

}
