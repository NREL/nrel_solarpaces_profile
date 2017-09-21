<?php

namespace Drupal\nrel_sp_project\Form;

use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;
use Drupal\Core\Link;
use Drupal\Core\Url;
use \Drupal\node\Entity\Node;
use \Drupal\file\Entity\File;
use Drupal\paragraphs\Entity\Paragraph;
use Drupal\Component\Utility\UrlHelper;

/**
 * Class uploadcsv.
 */
class uploadcsv extends FormBase {


  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'uploadcsv';
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {


    $form = [
      '#attributes' => ['enctype' => 'multipart/form-data'],
    ];


    $validators = [
      'file_validate_extensions' => ['csv'],
    ];

    //PROVIDE CSV UPLOAD INTERFACE
    $form['csv_file'] = [
      '#type' => 'managed_file',
      '#title' => $this->t('Upload csv'),
      '#upload_validators' => $validators,
      '#upload_location' => 'public://my_files/',
      '#description' => $this->t('This is where you upload your csv.'),
    ];

    $form['submit'] = [
      '#type' => 'submit',
      '#value' => $this->t('Submit'),
    ];

    //PROVIDE CSV DOWNLOAD LINK
    $link = Link::fromTextAndUrl('Download Project CSV Import Template', Url::fromRoute('nrel_sp_project.csvtemplate_export'));
    $html = $link->toString();
    $form['download_file'] = [
      '#type' => 'markup',
      '#markup' => '<br /><br /><p>' . $html . '</p>',
    ];

    return $form;
  }

  /**
   * {@inheritdoc}
   */
  public function validateForm(array &$form, FormStateInterface $form_state) {
    parent::validateForm($form, $form_state);
    $errors = [];
    if ($fid = $form_state->getValue('csv_file')) {
      $file = \Drupal\file\Entity\File::load($fid[0]);

      // We now need to check all of the fields from the file to make sure they are the right data types
      $projects = [];
      $header = NULL;
      if (($handle = fopen($file->getFileUri(), "r")) !== FALSE) {
        while (($row = fgetcsv($handle, 100000, ",")) !== FALSE) {
          if ($header === NULL) {
            $header = $row;
            continue;
          }
          $projects[] = array_combine($header, $row);
        }
      }

      $entityManager = \Drupal::service('entity_field.manager');
      $fields = $entityManager->getFieldDefinitions('node', 'project');
      $field_data = [];
      foreach ($fields as $key => $field) {
        $field_info = $field->getFieldStorageDefinition();
        if ($field_info->isBaseField() == FALSE) {
          $field_info = $field->getFieldStorageDefinition();
          $field_data[$key] = $field_info;
          $field_label_mapping[$field->label()] = $key;
        }
      }

      $project_row = 1;
      foreach ($projects AS $project) {
        foreach ($field_label_mapping AS $field_label => $node_field_machine_name) {
          switch ($field_label) {
            case 'County':
              // No need to validate that they entered a county
              break;
            case 'Address':
              // No need to validate that they entered an address
              break;
            case 'Lat/Long Location':
              $paragraph_type = 'lat_long_location';
              $machine_field_names = [
                'field_latitude_degrees' => 'Lat/Lon (Latitude Degrees)',
                'field_latitude_minutes' => 'Lat/Lon (Latitude Minutes)',
                'field_latitude_seconds' => 'Lat/Lon (Latitude Seconds)',
                'field_latitude_direction' => 'Lat/Lon (Latitude Direction)',
                'field_longitude_degrees' => 'Lat/Lon (Longitude Degrees)',
                'field_longitude_minutes' => 'Lat/Lon (Longitude Minutes)',
                'field_longitude_seconds' => 'Lat/Lon (Longitude Seconds)',
                'field_longitude_direction' => 'Lat/Lon (Longitude Direction)',
              ];
              // Get field info for these paragraph fields and validate them
              $entityManager = \Drupal::service('entity_field.manager');
              $paragraph_fields = $entityManager->getFieldDefinitions('paragraph', $paragraph_type);
              $paragraph_field_data = [];
              foreach ($paragraph_fields as $key => $field) {
                $field_info = $field->getFieldStorageDefinition();
                if ($field_info->isBaseField() == FALSE) {
                  $field_info = $field->getFieldStorageDefinition();
                  $paragraph_field_data[$key] = $field_info;
                }
              }
              foreach ($machine_field_names AS $machine_field_name => $field_sub_label) {
                import_csv_validate_field($errors, $paragraph_field_data[$machine_field_name]->getType(), $project[$field_sub_label], $field_sub_label, $form_state, $paragraph_field_data[$machine_field_name]);
              }
              break;
            case 'HCEs':
              $paragraph_type = 'hce';
              $machine_field_names = [
                'field_manufacturer' => 'HCEs 1 (Manufacturer)',
                'field_model' => 'HCEs 1 (Model)',
                'field_number_of_hces' => 'HCEs 1 (Number of HCEs)',
                'field_hce_type' => 'HCEs 1 (HCE Type)',
                'field_hce_length' => 'HCEs 1 (HCE Length)',
                'field_hce_length_tube_units' => 'HCEs 1 (HCE Length Tube Units)',
              ];
              // Get field info for these paragraph fields and validate them
              $entityManager = \Drupal::service('entity_field.manager');
              $paragraph_fields = $entityManager->getFieldDefinitions('paragraph', $paragraph_type);
              $paragraph_field_data = [];
              foreach ($paragraph_fields as $key => $field) {
                $field_info = $field->getFieldStorageDefinition();
                if ($field_info->isBaseField() == FALSE) {
                  $field_info = $field->getFieldStorageDefinition();
                  $paragraph_field_data[$key] = $field_info;
                }
              }
              foreach ($machine_field_names AS $machine_field_name => $field_sub_label) {
                import_csv_validate_field($errors, $paragraph_field_data[$machine_field_name]->getType(), $project[$field_sub_label], $field_sub_label, $form_state, $paragraph_field_data[$machine_field_name]);
              }

              $paragraph_type = 'hce';
              $machine_field_names = [
                'field_manufacturer' => 'HCEs 2 (Manufacturer)',
                'field_model' => 'HCEs 2 (Model)',
                'field_number_of_hces' => 'HCEs 2 (Number of HCEs)',
                'field_hce_type' => 'HCEs 2 (HCE Type)',
                'field_hce_length' => 'HCEs 2 (HCE Length)',
                'field_hce_length_tube_units' => 'HCEs 2 (HCE Length Tube Units)',
              ];
              // Get field info for these paragraph fields and validate them
              foreach ($machine_field_names AS $machine_field_name => $field_sub_label) {
                import_csv_validate_field($errors, $paragraph_field_data[$machine_field_name]->getType(), $project[$field_sub_label], $field_sub_label, $form_state, $paragraph_field_data[$machine_field_name]);
              }
              break;
            case 'Owner(s)':
              $paragraph_type = 'owners';
              $machine_field_names = [
                'field_owner' => 'Owner 1 (Owner)',
                'field_owner_percent' => 'Owner 1 (Owner Percent)',
              ];
              // Get field info for these paragraph fields and validate them
              $entityManager = \Drupal::service('entity_field.manager');
              $paragraph_fields = $entityManager->getFieldDefinitions('paragraph', $paragraph_type);
              $paragraph_field_data = [];
              foreach ($paragraph_fields as $key => $field) {
                $field_info = $field->getFieldStorageDefinition();
                if ($field_info->isBaseField() == FALSE) {
                  $field_info = $field->getFieldStorageDefinition();
                  $paragraph_field_data[$key] = $field_info;
                }
              }
              foreach ($machine_field_names AS $machine_field_name => $field_sub_label) {
                import_csv_validate_field($errors, $paragraph_field_data[$machine_field_name]->getType(), $project[$field_sub_label], $field_sub_label, $form_state, $paragraph_field_data[$machine_field_name]);
              }

              $paragraph_type = 'owners';
              $machine_field_names = [
                'field_owner' => 'Owner 2 (Owner)',
                'field_owner_percent' => 'Owner 2 (Owner Percent)',
              ];
              // Get field info for these paragraph fields and validate them
              $entityManager = \Drupal::service('entity_field.manager');
              $paragraph_fields = $entityManager->getFieldDefinitions('paragraph', $paragraph_type);
              $paragraph_field_data = [];
              foreach ($paragraph_fields as $key => $field) {
                $field_info = $field->getFieldStorageDefinition();
                if ($field_info->isBaseField() == FALSE) {
                  $field_info = $field->getFieldStorageDefinition();
                  $paragraph_field_data[$key] = $field_info;
                }
              }
              foreach ($machine_field_names AS $machine_field_name => $field_sub_label) {
                import_csv_validate_field($errors, $paragraph_field_data[$machine_field_name]->getType(), $project[$field_sub_label], $field_sub_label, $form_state, $paragraph_field_data[$machine_field_name]);
              }
              break;
            case 'Contact(s)':
              if ($project['Contact 1 (Email)'] <> '' && !\Drupal::service('email.validator')->isValid($project['Contact 1 (Email)'])) {
                $errors[] = t('Please enter a valid email address for Contact 1 (Email).');
              }
              if ($project['Contact 2 (Email)'] <> '' && !\Drupal::service('email.validator')->isValid($project['Contact 2 (Email)'])) {
                $errors[] = t('Please enter a valid email address for Contact 2 (Email).');
              }
              break;
            case 'Developer(s)':
              // No need to validate that they entered Developers
              break;
            case 'Operator(s)':
              // No need to validate that they entered Operators
              break;
            case 'Photo':
              if ($project['Photo (URL)'] <> '' && !(strpos($project['Photo (URL)'], 'http') !== FALSE && UrlHelper::isValid($project['Photo (URL)']))) {
                $errors[] = t('Please enter a valid URL for the Photo (URL).');
              }
              break;
            case 'Key References':
              if (!($project['Key Reference (URL)'] <> '' && strpos($project['Key Reference (URL)'], 'http') !== FALSE && UrlHelper::isValid($project['Key Reference (URL)']))) {
                $errors[] = t('Please enter a valid URL for the Key Reference (URL).');
              }
              break;
            case 'Generation Offtaker(s)':
              // No need to validate that they entered Generation Offtakers
              break;
            case 'Status':
            case 'Technology':
              // Taxonomy terms
              $term = \Drupal::entityTypeManager()
                ->getStorage('taxonomy_term')
                ->loadByProperties(['name' => $project[$field_label]]);
              $tid = array_keys($term);
              if (!isset($tid[0])) {
                $valid_terms = [];
                $terms = \Drupal::entityManager()->getStorage('taxonomy_term')->loadTree($field_label);
                foreach ($terms AS $term) {
                  $valid_terms[] = $term->name;
                }
                $errors[] = t('Please enter a valid term for :field_label (:valid_terms).', array(':field_label' => $field_label, ':valid_terms' => implode(', ', $valid_terms)));
              }
              break;
            default:
              if (isset($project[$field_label]) && $project[$field_label] <> '') {
                import_csv_validate_field($errors, $field_data[$node_field_machine_name]->getType(), trim($project[$field_label]), $field_label, $form_state, $field_data[$node_field_machine_name]);
              }
          }
        }
        $project_row++;
      }
    }
    if (count($errors) > 0) {
      foreach ($errors AS $index => $error) {
        $errors[$index] = "Row {$project_row}: " . $error->render();
      }
      $render = [
        '#theme' => 'item_list',
        '#items' => $errors,
      ];

      $item_list = \Drupal::service('renderer')->render($render);
      $form_state->setErrorByName('csv_file', $item_list);
    }
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
    if ($fid = $form_state->getValue('csv_file')) {

      import_from_csv($fid[0]);
    }

  }

}

function import_csv_validate_field(&$errors, $type, $value, $field_label, $form_state, $field_config) {
  if (isset($value) && $value <> '') {
    switch ($type) {
      case 'integer':
        if (!is_numeric($value)) {
          $errors[] = t('Please enter an integer for :field_label.', [':field_label' => $field_label]);
        }
        break;
      case 'decimal':
        if (!is_numeric($value)) {
          $errors[] = t('Please enter a float value for :field_label.', [':field_label' => $field_label]);
        }
        break;
      case 'datetime':
        break;
      case 'link':
        if (!UrlHelper::isValid($value)) {
          $errors[] = t('Please enter a valid link for :field_label.', [':field_label' => $field_label]);
        }
        break;
      case 'list_string':
        $allowed_values = $field_config->getSetting('allowed_values');
        if (!in_array($value, $allowed_values)) {
          $errors[] = t('Please enter a valid value for :field_label (:valid_values).', [':field_label' => $field_label, ':valid_values' => implode(', ', $allowed_values)]);
        }
        break;
    }
  }
}

function import_from_csv($fid) {
  $user = \Drupal\user\Entity\User::load(\Drupal::currentUser()->id());
  $file = \Drupal::entityTypeManager()->getStorage('file')->load($fid);
  $path_to_profile = drupal_get_path('profile', 'nrel_solarpaces_profile');

  $projects = [];
  $header = null;
  if (($handle = fopen($file->getFileUri(), "r")) !== FALSE) {
    while (($row = fgetcsv($handle, 100000, ",")) !== FALSE) {
      if ($header === null) {
        $header = $row;
        continue;
      }
      $projects[] = array_combine($header, $row);
    }
  }

  $entityManager = \Drupal::service('entity_field.manager');
  $fields = $entityManager->getFieldDefinitions('node', 'project');
  $field_label_mapping = [];
  $excluded_keys = [
    'panelizer',
  ];
  $field_data = [];
  foreach ($fields as $key => $field) {
    $field_info = $field->getFieldStorageDefinition();
    if ($field_info->isBaseField() == FALSE && !in_array($key, $excluded_keys)) {
      $field_info = $field->getFieldStorageDefinition();
      $field_data[$key] = $field_info;
      $field_label_mapping[$field->label()] = $key;
    }
  }

  foreach ($projects AS $project) {
    // Create node object.
    $node = Node::create([
      'type' => 'project',
      'title' => $project['Title'],
    ]);
    $paragraphs = [];
    foreach ($field_label_mapping AS $field_label => $node_field_machine_name) {
      switch ($field_label) {
        case 'County':
          $node->set($node_field_machine_name, $project['Address (County)']);
          break;
        case 'Address':
          $admin_area = '';
          //SOME COUNTRIES HAVE STATES
          if (isset($project['Address (State)']) && trim($project['Address (State)']) != '') {
            $admin_area = $project['Address (State)'];
          }
          //SOME COUNTRIES HAVE REGIONS
          if ($admin_area == '' && isset($project['Address (Region)']) && trim($project['Address (Region)']) != '') {
            $admin_area = $project['Address (Region)'];
          }
          $address = [
            'locality' => $project['Address (City)'],
            'country_code' => $project['Address (Country)'],
            'administrative_area' => $admin_area,
            'langcode' => 'en',
          ];

          $node->set('field_address', $address);
          break;
        case 'Lat/Long Location':
          $paragraph = [];
          $paragraph['type'] = 'lat_long_location';
          $paragraph['field_latitude_degrees'] = $project['Lat/Lon (Latitude Degrees)'];
          $paragraph['field_latitude_minutes'] = $project['Lat/Lon (Latitude Minutes)'];
          $paragraph['field_latitude_seconds'] = $project['Lat/Lon (Latitude Seconds)'];
          $paragraph['field_latitude_direction'] = $project['Lat/Lon (Latitude Direction)'];
          $paragraph['field_longitude_degrees'] = $project['Lat/Lon (Longitude Degrees)'];
          $paragraph['field_longitude_minutes'] = $project['Lat/Lon (Longitude Minutes)'];
          $paragraph['field_longitude_seconds'] = $project['Lat/Lon (Longitude Seconds)'];
          $paragraph['field_longitude_direction'] = $project['Lat/Lon (Longitude Direction)'];
          $paragraph_entity = Paragraph::create($paragraph);
          $paragraph_entity->save();
          $paragraphs['field_lat_long_location'] = $paragraph_entity;
          break;
        case 'HCEs':
          $paragraphs['field_hces'] = [];

          $paragraph = [];
          $paragraph['type'] = 'hce';
          $paragraph['field_manufacturer'] = $project['HCEs 1 (Manufacturer)'];
          $paragraph['field_model'] = $project['HCEs 1 (Model)'];
          $paragraph['field_number_of_hces'] = $project['HCEs 1 (Number of HCEs)'];
          $paragraph['field_hce_type'] = $project['HCEs 1 (HCE Type)'];
          $paragraph['field_hce_length'] = $project['HCEs 1 (HCE Length)'];
          $paragraph['field_hce_length_tube_units'] = $project['HCEs 1 (HCE Length Tube Units)'];
          $paragraph_entity = Paragraph::create($paragraph);
          $paragraph_entity->save();
          $paragraphs['field_hces'][] = $paragraph_entity;

          if (isset($project['HCEs 2 (Manufacturer)']) && trim($project['HCEs 2 (Manufacturer)']) <> '') {
            $paragraph = [];
            $paragraph['type'] = 'hce';
            $paragraph['field_manufacturer'] = $project['HCEs 2 (Manufacturer)'];
            $paragraph['field_model'] = $project['HCEs 2 (Model)'];
            $paragraph['field_number_of_hces'] = $project['HCEs 2 (Number of HCEs)'];
            $paragraph['field_hce_type'] = $project['HCEs 2 (HCE Type)'];
            $paragraph['field_hce_length'] = $project['HCEs 2 (HCE Length)'];
            $paragraph['field_hce_length_tube_units'] = $project['HCEs 2 (HCE Length Tube Units)'];
            $paragraph_entity = Paragraph::create($paragraph);
            $paragraph_entity->save();
            $paragraphs['field_hces'][] = $paragraph_entity;
          }
          break;
        case 'Owner(s)':
          $paragraphs['field_owners'] = [];

          $paragraph = [];
          $paragraph['type'] = 'owners';
          $paragraph['field_owner'] = $project['Owner 1 (Owner)'];
          $paragraph['field_owner_percent'] = $project['Owner 1 (Owner Percent)'];
          $paragraph_entity = Paragraph::create($paragraph);
          $paragraph_entity->save();
          $paragraphs['field_owners'][] = $paragraph_entity;

          if (isset($project['Owner 2 (Owner)']) && trim($project['Owner 2 (Owner)']) <> '') {
            $paragraph = [];
            $paragraph['type'] = 'owners';
            $paragraph['field_owner'] = $project['Owner 2 (Owner)'];
            $paragraph['field_owner_percent'] = $project['Owner 2 (Owner Percent)'];
            $paragraph_entity = Paragraph::create($paragraph);
            $paragraph_entity->save();
            $paragraphs['field_owners'][] = $paragraph_entity;
          }
          break;
        case 'Contact(s)':
          $paragraphs['field_contact'] = [];

          $paragraph = [];
          $paragraph['type'] = 'contact';
          $paragraph['field_email_address'] = $project['Contact 1 (Email)'];
          $paragraph['field_contact_name'] = $project['Contact 1 (Contact Name)'];
          $paragraph['field_company'] = $project['Contact 1 (Company Name)'];
          $paragraph['field_contact_website'] = $project['Contact 1 (Company Website)'];
          $paragraph_entity = Paragraph::create($paragraph);
          $paragraph_entity->save();
          $paragraphs['field_contact'][] = $paragraph_entity;

          if (trim($project['Contact 2 (Email)']) != '') {
            $paragraph = [];
            $paragraph['type'] = 'contact';
            $paragraph['field_email_address'] = $project['Contact 2 (Email)'];
            $paragraph['field_contact_name'] = $project['Contact 2 (Contact Name)'];
            $paragraph['field_company'] = $project['Contact 2 (Company Name)'];
            $paragraph['field_contact_website'] = $project['Contact 2 (Company Website)'];
            $paragraph_entity = Paragraph::create($paragraph);
            $paragraph_entity->save();
            $paragraphs['field_contact'][] = $paragraph_entity;
          }
          break;
        case 'Developer(s)':
          $developers = [];
          $developers[] = $project['Developer 1'];
          if (trim($project['Developer 2']) != '') {
            $developers[] = $project['Developer 2'];
          }
          $node->set($node_field_machine_name, $developers);
          break;
        case 'Operator(s)':
          $operators = [];
          $operators[] = $project['Operator 1'];
          if (trim($project['Operator 2']) != '') {
            $operators[] = $project['Operator 2'];
          }
          $node->set($node_field_machine_name, $operators);
          break;
        case 'Photo':
          if($project['Photo (URL)'] != '') {
            // Create file object from a locally copied file.
            $photo_to_copy = system_retrieve_file($project['Photo (URL)'], file_directory_temp());
            $photo_to_copy = file_directory_temp() . '/' . basename($project['Photo (URL)']);
            $uri = file_unmanaged_move($photo_to_copy, 'public://photos/' . basename($project['Photo (URL)']));
            $file = File::Create([
              'uri' => $uri,
            ]);
            $file->save();

            $photodata = [
              'target_id' => $file->id(),
              'alt' => $project['Photo (Alt Text)'],
            ];
            $node->set($node_field_machine_name, $photodata);
          }
          break;
        case 'Key References':
          $paragraphs['field_reference_doc'] = [];

          $paragraph = [];
          $paragraph['type'] = 'reference_document';
          $paragraph['field_key_reference_url'] = $project['Key Reference (URL)'];
          $paragraph['field_key_reference_type'] = $project['Key Reference Type'];
          $paragraph_entity = Paragraph::create($paragraph);
          $paragraph_entity->save();
          $paragraphs['field_reference_doc'][] = $paragraph_entity;
          break;
        case 'Generation Offtaker(s)':
          $offtakers = [];
          $offtakers[] = $project['Generation Offtaker 1'];
          if (trim($project['Generation Offtaker 2']) != '') {
            $offtakers[] = $project['Generation Offtaker 2'];
          }
          $node->set($node_field_machine_name, $offtakers);
          break;
        case 'Status':
        case 'Technology':
          // Taxonomy terms
          $term = \Drupal::entityTypeManager()
            ->getStorage('taxonomy_term')
            ->loadByProperties(['name' => $project[$field_label]]);
          $tid = array_keys($term);
          if (isset($tid[0])) {
            $node->set($node_field_machine_name, ['target_id' => $tid[0]]);
          }
          break;
        default:
          if ($field_data[$node_field_machine_name]->getType() == 'datetime') {
            $node->set($node_field_machine_name, (isset($project[$field_label]) ? date("Y-m-d", strtotime($project[$field_label])) : ''));
          } else {
            $node->set($node_field_machine_name, (isset($project[$field_label]) ? $project[$field_label] : ''));
          }
      }
    }
    foreach ($paragraphs AS $paragraph_field_name => $paragraph) {
      $current = [];
      if (is_array($paragraph)) {
        foreach ($paragraph AS $one_paragraph) {
          $current[] = [
            'target_id' => $one_paragraph->id(),
            'target_revision_id' => $one_paragraph->getRevisionId(),
          ];
        }
      } else {
        $current[] = [
          'target_id' => $paragraph->id(),
          'target_revision_id' => $paragraph->getRevisionId(),
        ];
      }
      $node->set($paragraph_field_name, $current);
    }
    // Not sure what moderation state to set imported projects to.
    // Could be based on the user's permissions
    $node->setPublished(0);
    $node->set('moderation_state', 'draft');
    $node->setOwner($user);
    $node->save();
    drupal_set_message("Imported project {$project['Title']}");
  }

}

