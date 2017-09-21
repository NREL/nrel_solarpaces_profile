<?php

namespace Drupal\nrel_sp_project\Controller;

use Drupal\Core\Controller\ControllerBase;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Drupal\Core\StreamWrapper\PublicStream;
/**
 * Class csvtemplate.
 */
class csvtemplate extends ControllerBase {

  /**
   * Redirect to the current project import template file.
   */
  public function export() {
    // Create a current project import template file
    nrel_sp_project_create_project_csv_template();

    // Redirect to the current project import template file
    $redirect_url = PublicStream::baseUrl() . "/project-import-template.csv";
    return new RedirectResponse($redirect_url);
  }
}