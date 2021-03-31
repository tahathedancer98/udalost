<?php

namespace udalost\backoffice\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;  

class Evenement extends Model {
  protected $table = 'evenement';
  protected $primaryKey = 'id';
	public $incrementing = false;   // pas d'auto incrementation
	public $keyType = 'string';		// id sous forme de string
	public $timestamps = false; // By default laravel will expect created_at & updated_at column in your table. By making it to false it will override the default setting.

	public function createur() {
		return $this->belongsTo('udalost\backoffice\models\Utilisateur', 'id_utilisateur');
	}

	public function participantsNonInscrits() {
		return $this->hasMany('udalost\backoffice\models\Participant', 'id_evenement')->where('id_utilisateur', '=', NULL);
	}

  public function participants() {
		return $this->belongsToMany('udalost\backoffice\models\Utilisateur', // Table cible
	           						'participant', // Table Pivot
	           						'id_evenement', // Foreign Key cible de la table pivot
	        						'id_utilisateur') // Foreign Key assoc 
					->withPivot(['id','nom','status','message','id_utilisateur','id_evenement']);
	}
} 