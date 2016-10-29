class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    require 'routific'

    routific = Routific.setToken(ENV["routific_token"])

    visits = {
      "Adel LEMCHEMA": { "location": { "name":"52 boulevard Jean XXIII, 69008, Lyon, France", "lat":45.7383941, "lng":4.8718042}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "Alex Robini": { "location": { "name":"10 rue Louis Thevenet, Allée 3C, 69004, Lyon, France", "lat":45.778519, "lng":4.837964}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "Aline Valdenaire": { "location": { "name":"63 bis rue Villon, 69008, Lyon, France", "lat":45.741324, "lng":4.8644375}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "Amandine Piérot Blanc": { "location": { "name":"2 Rue Raspail, 69100, Villeurbanne, France", "lat":45.7732207, "lng":4.8798992}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "Anaick CHaloppé": { "location": { "name":"1 rUe dU MAnteau jAune, 69005, Lyon, France", "lat":45.7561116, "lng":4.8116423}, "duration":8, "load":1, "start":"18:00", "end":"20:00"},
      "Angélique CHABOD": { "location": { "name":"19 rue Maryse Bastié, 69008, Lyon, France", "lat":45.7408464, "lng":4.8743484}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "Arpana Fressonnet": { "location": { "name":"35 grande rue de vaise, 69009, Lyon, France", "lat":45.7742266, "lng":4.8080231}, "duration":8, "load":1, "start":"21:00", "end":"21:30"},
      "Aurélie Baraton": { "location": { "name":"27 avenue du général leclerc, 69100, Villeurbanne, France", "lat":45.7577376, "lng":4.8911575}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "Camille Dourver 3": { "location": { "name":"54 rue Waldeck rousseau, 69006, Lyon, France", "lat":45.7650414, "lng":4.8578729}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "Camille Point": { "location": { "name":"5 rue de nuits, 69004, Lyon, France", "lat":45.7781281, "lng":4.8338503}, "duration":8, "load":1, "start":"18:00", "end":"20:00"},
      "Charlotte Hoffmann": { "location": { "name":"61 rue Voltaire, 69003, Lyon, France", "lat":45.7570719, "lng":4.8490365}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "Chrystelle KARSENTY": { "location": { "name":"6 rue de l'éternité, 69008, Lyon, France", "lat":45.7414569, "lng":4.8587789}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "DAVID GARCIA": { "location": { "name":"39 rue Clément MICHUT, 69100, Villeurbanne, France", "lat":45.7658338, "lng":4.8813671}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "Delphine Mornet": { "location": { "name":"2 Rue De La Piemente, 69009, Lyon, France", "lat":45.7858404, "lng":4.8012165}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "ELODIE PREVELLE": { "location": { "name":"6A, PLACE DU TRAITE DE ROME, 69007, Lyon, France", "lat":45.736721, "lng":4.833691}, "duration":8, "load":1, "start":"18:00", "end":"20:00"},
      "Elodie Fragne": { "location": { "name":"57 rue Henri Chevalier, 69004, Lyon, France", "lat":45.7839996, "lng":4.8244675}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "Elodie Trichot Caillat": { "location": { "name":"39 rue Malesherbes, 69006, Lyon, France", "lat":45.7700005, "lng":4.8428457}, "duration":8, "load":1, "start":"18:00", "end":"20:00"},
      "Emmanuelle  NAUDAR": { "location": { "name":"335 rue Garibaldi, 69007, Lyon, France", "lat":45.7468272, "lng":4.8516004}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "Guillaume Gardette": { "location": { "name":"10, rue Louis Thévenet, 69004, Lyon, France", "lat":45.778519, "lng":4.837964}, "duration":8, "load":1, "start":"18:00", "end":"20:00"},
      "Héloïse Mor": { "location": { "name":"17 rue childebert, 69002, Lyon, France", "lat":45.7603519, "lng":4.8361998}, "duration":8, "load":1, "start":"18:00", "end":"20:00"},
      "Jade ABITBOL": { "location": { "name":"3 avenue du doyenné, 69005, Lyon, France", "lat":45.7595679, "lng":4.8266445}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "Janice Muller": { "location": { "name":"100 G cours lafayette, 69003, Lyon, France", "lat":45.7636278, "lng":4.8499317}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "Joel DUMONTET": { "location": { "name":"19 Rue Clément Michut, 69100, Villeurbanne, France", "lat":45.767217, "lng":4.8814481}, "duration":8, "load":1, "start":"20:00", "end":"22:00"},
      "Julie Ponsin": { "location": { "name":"22 rue Royale, 69001, Lyon, France", "lat":45.7707026, "lng":4.836968}, "duration":8, "load":1, "start":"17:00", "end":"17:30"},
      "Julien Van traelen": { "location": { "name":"86 cours vitton, 69006, Lyon, France", "lat":45.7698566, "lng":4.8582042}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "Juliette Souchal": { "location": { "name":"52 rue Abbé Boisard, 69003, Lyon, France", "lat":45.7506266, "lng":4.8582754}, "duration":8, "load":1, "start":"20:00", "end":"22:00"},
      "LILIANE PELLE": { "location": { "name":"31 RUE BARRIER, 69006, Lyon, France", "lat":45.7651703, "lng":4.8523205}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "Laure et Damien EVRARD": { "location": { "name":"68, boulevard Jean XXIII, 69008, Lyon, France", "lat":45.7376112, "lng":4.8695384}, "duration":8, "load":1, "start":"20:00", "end":"22:00"},
      "Laure-Audrey Chatain": { "location": { "name":"220 avenue Félix faure, 69003, Lyon, France", "lat":45.7552248, "lng":4.8735297}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "Ludovic CHIROL": { "location": { "name":"16 Résidence des Hauts de Saint-Just, 69005, Lyon, France", "lat":45.7546743, "lng":4.8204421}, "duration":8, "load":1, "start":"18:00", "end":"20:00"},
      "MARC BIDON": { "location": { "name":"27 rue de Créqui, 69006, Lyon, France", "lat":45.7742881, "lng":4.8452182}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "Madeline Cramard": { "location": { "name":"101A montée de choulans, 69001, Lyon, France", "lat":45.7533986, "lng":4.8172069}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "Marc-Alexandre ZAENKER": { "location": { "name":"169 avenue Berthelot, 69007, Lyon, France", "lat":45.7421998, "lng":4.8522294}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "Marie Courtheix": { "location": { "name":"7 rue Paul Verlaine, 69100, Villeurbanne, France", "lat":45.7685651, "lng":4.8804292}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "Marie Nicolino": { "location": { "name":"6, boulevard des Brotteaux, 69006, Lyon, France", "lat":45.7695303, "lng":4.856683}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "Marie-Joëlle  BLOCHET": { "location": { "name":"34 cours de la République, 69100, Villeurbanne, France", "lat":45.7682564, "lng":4.8738098}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "May BODRERO": { "location": { "name":"5 rue marie madeleine fourcade, 69007, Lyon, France", "lat":45.7373968, "lng":4.8380972}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "NOEMIE ROLAND": { "location": { "name":"3 RUE DU BRIGADIER VOITURET, 69007, Lyon, France", "lat":45.7468565, "lng":4.8469195}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "Nathalie CLAUSS": { "location": { "name":"86 rue Jean Sarrazin, 69008, Lyon, France", "lat":45.7305023, "lng":4.8631521}, "duration":8, "load":1, "start":"18:00", "end":"20:00"},
      "Pauline Rougé": { "location": { "name":"14 rue lanterne, 69001, Lyon, France", "lat":45.7664084, "lng":4.831535}, "duration":8, "load":1, "start":"20:00", "end":"22:00"},
      "Pierre-Antoine Chabriac": { "location": { "name":"94 rue Vauban, 69006, Lyon, France", "lat":45.765595, "lng":4.8517361}, "duration":8, "load":1, "start":"20:00", "end":"22:00"},
      "Riki Bohbot4": { "location": { "name":"4 Chemin De montpellas, 69009, Lyon, France", "lat":45.8003253, "lng":4.8296926}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "Sophia Gilot": { "location": { "name":"205 avenue Jean Jaurès, 69007, Lyon, France", "lat":45.7357867, "lng":4.8367085}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "Sophie  Spittael": { "location": { "name":"47 route de vienne, 69007, Lyon, France", "lat":45.7419703, "lng":4.850982}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "Sophie Daudé Romero": { "location": { "name":"27 rue EMile Duport, 69009, Lyon, France", "lat":45.7842001, "lng":4.8096397}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "Stéphane ROBERT": { "location": { "name":"15 rue Pierre Blanc, 69001, Lyon, France", "lat":45.770974, "lng":4.827704}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "Sylvain BADEL": { "location": { "name":"150 rue de Gerland, 69007, Lyon, France", "lat":45.7322197, "lng":4.83877}, "duration":8, "load":1, "start":"18:00", "end":"20:00"},
      "Sylvie Jolivot": { "location": { "name":"2 rue Antoine Bernoux, 69100, Villeurbanne, France", "lat":45.7710155, "lng":4.8874312}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "Tiffany Loomans": { "location": { "name":"6 rue Jean Louis Maubant, 69100, Villeurbanne, France", "lat":45.7581713, "lng":4.8775379}, "duration":8, "load":1, "start":"18:00", "end":"20:00"},
      "Télie MATHIOT": { "location": { "name":"42 Grande rue de la croix rousse, 69004, Lyon, France", "lat":45.7784959, "lng":4.8324723}, "duration":8, "load":1, "start":"20:00", "end":"22:00"},
      "Vanessa Minarro": { "location": { "name":"10 rue de flesselles, 69001, Lyon, France", "lat":45.7713399, "lng":4.8261313}, "duration":8, "load":1, "start":"18:00", "end":"20:00"},
      "William BURKE": { "location": { "name":"65 rue de saint cyr, 69009, Lyon, France", "lat":45.7856284, "lng":4.8073076}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "amelie boespflug": { "location": { "name":"20 rue saint jerome, 69007, Lyon, France", "lat":45.7496458, "lng":4.8435504}, "duration":8, "load":1, "start":"18:00", "end":"20:00"},
      "christophe  BRENOT": { "location": { "name":"10 rue Professeur Tavernier, 69008, Lyon, France", "lat":45.7281327, "lng":4.8671003}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "fabrice Liut": { "location": { "name":"11 rue de l'annonciade, 69001, Lyon, France", "lat":45.7698827, "lng":4.8283861}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "ilene grange": { "location": { "name":"71 rue chevreul, 69007, Lyon, France", "lat":45.7477106, "lng":4.842785}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "laurent castro": { "location": { "name":"7 rue jean pierre lévy, 69003, Lyon, France", "lat":45.7537572, "lng":4.8650826}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "léa zielinski": { "location": { "name":"23 rue volney, 69008, Lyon, France", "lat":45.7403881, "lng":4.8837926}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "magali le mouel": { "location": { "name":"10 rue germain, 69006, Lyon, France", "lat":45.765048, "lng":4.8625915}, "duration":8, "load":1, "start":"20:00", "end":"22:00"},
      "marie vuaillat": { "location": { "name":"30 quai saint vincent, 69001, Lyon, France", "lat":45.7685834, "lng":4.8239819}, "duration":8, "load":1, "start":"20:00", "end":"22:00"},
      "pauline belin": { "location": { "name":"29 rue creuzet, 69007, Lyon, France", "lat":45.7497471, "lng":4.8456532}, "duration":8, "load":1, "start":"19:00", "end":"21:00"},
      "sandrine battendier": { "location": { "name":"6 allee de l'aurore, 69005, Lyon, France", "lat":45.7579923, "lng":4.7963761}, "duration":8, "load":1, "start":"17:00", "end":"19:00"},
      "sylvie lavanant": { "location": { "name":"178 cours emile zola, 69100, Villeurbanne, France", "lat":45.7688042, "lng":4.881009}, "duration":8, "load":1, "start":"17:00", "end":"19:00"}
    }

    fleet = {
      "abc" => {
        "start_location" => {
          "name":"105 avenue jean jaurès, oullins",
          "lat":45.7136576,
          "lng":4.8194686
        },
        "end_location" => {
          "name":"105 avenue jean jaurès, oullins",
          "lat":45.7136576,
          "lng":4.8194686
        },
        "shift_start" => "16:00",
        "shift_end" => "22:00"
      }
    }

    data = {
      visits: visits,
      fleet: fleet
    }

    route = Routific.getRoute(data)
    @route = route
    @vehicle = route.vehicleRoutes.first.first
    raise
  end
end
