<?php

namespace Drupal\nrel_sp_project\Plugin\Block;

use Drupal\Core\Block\BlockBase;

/**
 * Provides a 'ProjectLabelsSolarField' block.
 *
 * @Block(
 *  id = "project_label_SolarField",
 *  admin_label = @Translation("Project Label: Solar Field"),
 * )
 */
class ProjectLabelsSolarField extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {
    $build = [];
    $build['more_questions']['#markup'] = '<h3>Solar Field</h3>';

    return $build;
  }

}
