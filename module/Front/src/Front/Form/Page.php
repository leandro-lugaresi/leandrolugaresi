<?php

namespace Front\Form;

use ModulusForm\Form\FormDefault,
    Zend\Form\Element\Select;
use Zend\InputFilter;
use Zend\Form\Fieldset;

class Page extends FormDefault
{

    public function addElements()
    {

        $fieldsetGeral = new Fieldset('geral');
        $fieldsetOptions = new Fieldset('options');

        $fieldsetGeral->add(array(
            'name' => 'id',
            'options' => array(
                'label' => '',
            ),
            'attributes' => array(
                'type' => 'hidden'
            ),
        ));

        $fieldsetGeral->add(array(
            'name' => 'title',
            'options' => array(
                'label' => 'Título: ',
            ),
            'type' => 'Zend\Form\Element\Text',
            'attributes' => array(
                'placeholder' => 'Entre com o título da postagem',
            ),
        ));

        // $this->add(array(
        //     'name' => 'url',
        //     'options' => array(
        //         'label' => 'Url da página: ',
        //     ),
        //     'type' => 'Zend\Form\Element\Text',
        //     'attributes' => array(
        //         'placeholder' => '/titulo-da-postagem',
        //     ),
        // ));

        $fieldsetOptions->add(array(
            'name' => 'status',
            'type' => 'select',
            'options' => array(
                'label' => 'Status:',
                //'empty_option' => 'Todas as ações',
                'value_options' => array(

                ),
            )
        ));

        $fieldsetOptions->add(array(
            'type'    => 'DoctrineModule\Form\Element\ObjectSelect',
            'name'    => 'parent',
            'options' => array(
                'label'          => 'Página pai: ',
                'object_manager' => $this->getEntityManager(),
                'target_class'   => 'Front\Entity\SiteContent',
                'find_method' => array(
                    'name' => 'findAll',
                    //'params' => array('criteria' => array('type' => )),
                ),
                'property'       => 'title',
                'selected' =>1,
                'empty_option'   => '',
            ),
        ));

        $fieldsetGeral->add(array(
            'name' => 'text',
            'options' => array(
                'label' => 'Conteudo: ',
            ),
            'type' => 'ModulusForm\Form\Element\Texteditor',
        ));

        $fieldsetOptions->add(array(
            'name' => 'submit',
            'attributes' => array(
                'value' => 'Salvar',
                'type'  => 'submit',
                'class' => 'btn btn-primary',
            ),
        ));

        $fieldsetOptions->add(array(
            'name' => 'publicar',
            'attributes' => array(
                'value' => 'Publicar',
                'type'  => 'submit',
                'class' => 'btn btn-danger',
            ),
        ));

        $this->add($fieldsetGeral);
        $this->add($fieldsetOptions);
    }

    public function addInputFilter()
    {
        $inputFilter = new InputFilter\InputFilter();
        $fieldsetGeral = new InputFilter\InputFilter();
        $fieldsetOptions = new InputFilter\InputFilter();

        $fieldsetGeral->add(array(
            'name'       => 'title',
            'required'   => true,
            'validators' => array(
                array(
                    'name'    => 'StringLength',
                    'options' => array(
                        'min' => 3,
                        'max' => 255,
                    ),
                ),
            ),
            'filters'   => array(
                array('name' => 'StringTrim'),
            ),
        ));

        $fieldsetGeral->add(array(
            'name'       => 'text',
            'required'   => true,
            'filters'   => array(
                array('name' => 'StringTrim'),
            ),
        ));

        $fieldsetOptions->add(array(
            'name'       => 'parent',
            'required'   => false,
        ));

        $inputFilter->add($fieldsetGeral, 'geral');
        $inputFilter->add($fieldsetOptions, 'options');
        $this->setInputFilter($inputFilter);
    }
}
