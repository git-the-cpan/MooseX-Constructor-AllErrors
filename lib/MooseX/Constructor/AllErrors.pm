package MooseX::Constructor::AllErrors;
BEGIN {
  $MooseX::Constructor::AllErrors::AUTHORITY = 'cpan:HDP';
}
# git description: v0.022-2-gaf92436
$MooseX::Constructor::AllErrors::VERSION = '0.023';
# ABSTRACT: capture all constructor errors

use Moose ();
use Moose::Exporter;

use MooseX::Constructor::AllErrors::Error;
use MooseX::Constructor::AllErrors::Error::Constructor;
use MooseX::Constructor::AllErrors::Error::Required;
use MooseX::Constructor::AllErrors::Error::TypeConstraint;
use MooseX::Constructor::AllErrors::Error::Misc;

Moose::Exporter->setup_import_methods(
    base_class_roles => [ 'MooseX::Constructor::AllErrors::Role::Object' ],
);

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

MooseX::Constructor::AllErrors - capture all constructor errors

=head1 VERSION

version 0.023

=head1 SYNOPSIS

  package MyClass;
  use MooseX::Constructor::AllErrors;

  has foo => (is => 'ro', required => 1);
  has bar => (is => 'ro', isa => 'Int');

  ...

  eval { MyClass->new(bar => "hello") };
  # $@->errors has two errors, not just the missing required attribute

=head1 DESCRIPTION

MooseX::Constructor::AllErrors tries to capture every error generated during
the construction of your objects, rather than halting after the first.

If there are errors, C<$@> will contain a
L<MooseX::Constructor::AllErrors::Error::Constructor> object.  See its
documentation for possible error types.

=head1 SEE ALSO

L<Moose>

=head1 AUTHOR

Hans Dieter Pearcey <hdp@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Hans Dieter Pearcey.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
