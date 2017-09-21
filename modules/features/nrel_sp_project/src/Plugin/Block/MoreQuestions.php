<?php

namespace Drupal\nrel_sp_project\Plugin\Block;

use Drupal\Core\Block\BlockBase;

/**
 * Provides a 'MoreQuestions' block.
 *
 * @Block(
 *  id = "more_questions",
 *  admin_label = @Translation("More questions sidebar"),
 * )
 */
class MoreQuestions extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {
    $build = [];
    $build['more_questions']['#markup'] = '<p><a href="mailto:Webmaster_Solar@nrel.gov?subject=SolarPaces">Do you have more information, corrections, or comments</a>?</p>';

    return $build;
  }

}
