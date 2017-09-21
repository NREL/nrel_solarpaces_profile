<?php

namespace Drupal\nrel_sp_project\Plugin\Block;

use Drupal\Core\Block\BlockBase;

/**
 * Provides a 'ProjectLabelsBackground' block.
 *
 * @Block(
 *  id = "project_label_background",
 *  admin_label = @Translation("Project Label: Background"),
 * )
 */
class ProjectLabelsBackground extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {
    $build = [];
    $build['more_questions']['#markup'] = '<h2>Background</h2>';

    return $build;
  }

}
