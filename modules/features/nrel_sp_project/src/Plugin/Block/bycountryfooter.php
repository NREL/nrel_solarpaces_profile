<?php

namespace Drupal\nrel_sp_project\Plugin\Block;

use Drupal\Core\Block\BlockBase;
use Drupal\Core\Form\FormStateInterface;

/**
 * Provides a 'bycountryfooter' block.
 *
 * @Block(
 *  id = "bycountryfooter",
 *  admin_label = @Translation("By Country Footer"),
 * )
 */
class bycountryfooter extends BlockBase {


  /**
   * {@inheritdoc}
   */
  public function defaultConfiguration() {
    return [
        'text' => $this->t('You can also access information on CSP projects using <a href="/">other sorting options</a>.'),
      ] + parent::defaultConfiguration();

  }

  /**
   * {@inheritdoc}
   */
  public function blockForm($form, FormStateInterface $form_state) {
    $form['text'] = [
      '#type' => 'text_format',
      '#title' => $this->t('Text'),
      '#description' => $this->t(''),
      '#default_value' => $this->configuration['text']['value'],
      '#weight' => '0',
    ];

    return $form;
  }

  /**
   * {@inheritdoc}
   */
  public function blockSubmit($form, FormStateInterface $form_state) {
    $this->configuration['text'] = $form_state->getValue('text');
  }

  /**
   * {@inheritdoc}
   */
  public function build() {
    $build = [];
    $build['bycountryfooter_text']['#markup'] = '<p>' . $this->configuration['text']['value'] . '</p>';

    return $build;
  }

}
