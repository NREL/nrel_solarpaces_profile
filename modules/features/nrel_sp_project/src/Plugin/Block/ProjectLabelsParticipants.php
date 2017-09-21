<?php

namespace Drupal\nrel_sp_project\Plugin\Block;

use Drupal\Core\Block\BlockBase;

/**
 * Provides a 'ProjectLabelsParticipants' block.
 *
 * @Block(
 *  id = "project_label_participants",
 *  admin_label = @Translation("Project Label: Participants"),
 * )
 */
class ProjectLabelsParticipants extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {
    $build = [];
    $build['more_questions']['#markup'] = '<h2>Participants</h2>';

    return $build;
  }

}
