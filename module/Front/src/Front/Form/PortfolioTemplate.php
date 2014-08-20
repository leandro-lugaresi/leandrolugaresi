<?php

namespace Front\Form;

use ModulusForm\Form\FormDefault,
    Zend\Form\Element\Select;

class PortfolioTemplate extends FormDefault
{

    public function addElements()
    {

        $this->add(array(
            'name' => 'entity',
            'type' => 'Zend\Form\Element\Hidden',
        ));

        $this->add(array(
            'name' => 'entityId',
            'type' => 'Zend\Form\Element\Hidden',
        ));

        $this->add(array(
            'name' => 'client',
            'options' => array(
                'label' => 'Cliente: ',
            ),
            'type' => 'Zend\Form\Element\Text',
        ));

        $this->add(array(
            'name' => 'urlProject',
            'options' => array(
                'label' => 'Url do projeto: ',
            ),
            'type' => 'Zend\Form\Element\Url',
        ));

        $this->add(array(
            'name' => 'date',
            'options' => array(
                'label' => 'Data do projeto: ',
            ),
            'type' => 'Zend\Form\Element\Date',
        ));

        $this->add(array(
            'name' => 'galleryType',
            'options' => array(
                'label' => 'Tipo de galeria: ',
                'value_options' => array(
                    'wide' => 'Wide Slider',
                    'fullscreen' => 'Fullscreen Slider',
                    'half' => 'Half Slider',
                ),
            ),
            'type' => 'Zend\Form\Element\Radio',
        ));

        $this->add(array(
            'name' => 'imageHeader',
            'options' => array(
                'label' => 'Imagem do cabeçalho: ',
            ),
            'type' => 'ModulusForm\Form\Element\SelectImage',
        ));
    }

    public function addInputFilter()
    {

    }
}
